package teste.ndk;

import java.io.File;

import magick.ImageInfo;
import magick.Magick;
import magick.MagickException;
import magick.MagickImage;
import magick.NoiseType;
import magick.util.MagickBitmap;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

//
// 	2016/04/04 D.Slamnig modified
//	2016/04/25 D.Slamnig modified
//
public class AndroidMagickActivity extends Activity
{
	private static final String LOGTAG = "AndroidMagickActivity.java";
	private static final int REQUEST_CODE_PICK = 1;
	// Reduce loaded/displayed bitmap to max size:
	private static final int MAX_BITMAP_DIMENSION = 360; // small for testing
	
	private AndroidMagickActivity m_This;
    private Prefs m_Prefs;
	
	private String m_ImagePath = null;
	private MagickImage m_MagickImage = null;
	private MagickImage m_EffectImage = null;
	
	private TextView m_TextEffect;
	private Spinner m_SpinEffect;
	private ImageView m_ImageView;

	private ExportDialog m_ExportDialog = null;
		
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		setContentView(R.layout.activity_magick);
		
		m_This = this;
		m_Prefs = new Prefs(this);
		
		Log.d(LOGTAG, "onCreate()");
		
		// set image cache temp directory in ImageMagick:
		AndroidMagick.setCacheDir(this);
				
		m_TextEffect = (TextView)findViewById(R.id.textEffect);
		m_SpinEffect = (Spinner)findViewById(R.id.spinEffect);
		m_ImageView = (ImageView)findViewById(R.id.imageView);
		
		ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,
				R.array.effects, android.R.layout.simple_spinner_item);
		
		adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		m_SpinEffect.setAdapter(adapter);
		
		m_SpinEffect.setOnItemSelectedListener(new OnItemSelectedListener() {
			public void onItemSelected(AdapterView<?> parent, View view, int pos, long id) {
				if(m_MagickImage != null){
					showStatus("Working...");
					applyEffectAsync(pos);
				}
			}

			public void onNothingSelected(AdapterView<?> parent) {
			}
		});
		
		// restore current image if needed:
		if(savedInstanceState != null)
			m_ImagePath = m_Prefs.getImagePath();
			
		showStatus("");
		enableUI(true);
	}
	
	@Override
	public void onStart()
	{
		super.onStart();
		
		/*
		if(m_ImagePath != null){
			showStatus("Loading image...");
			loadImage();
		}
		*/
	}
	
	@Override
	public void onStop()
	{
		// store current imge path:
		if(m_ImagePath != null)
			m_Prefs.setImagePath(m_ImagePath);
		
		super.onStop();
	}
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present:
		getMenuInflater().inflate(R.menu.teste_ndk, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// if UI active:
		if(m_SpinEffect.isEnabled() == true){
			// Handle action bar item clicks: 
			int id = item.getItemId();
			
			if(id == R.id.load) {
				pickImage();
				return true;
			}
			else if(id == R.id.save) {
				if(m_EffectImage != null){
					m_ExportDialog = new ExportDialog(this);
					m_ExportDialog.show(m_EffectImage);
				}	
				return true;
			}
		}
		return super.onOptionsItemSelected(item);
	}
	
	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent intent)
	{
		Log.d(LOGTAG, "onActivityResult()");
		
		switch(requestCode){
		case REQUEST_CODE_PICK:
			if(resultCode == RESULT_OK){
				Uri targetUri = intent.getData();
				m_ImagePath = getRealPathFromUri(targetUri);
				showStatus("Loading image...");
				loadImage();
			}
			else{
				showStatus("");
				enableUI(true);
			}
			break;
		default:
			super.onActivityResult(requestCode, resultCode, intent);
			break;
		}
	}
	
	private void pickImage()
	{
		Intent loadPicture = new Intent(Intent.ACTION_PICK, android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
		startActivityForResult(loadPicture, REQUEST_CODE_PICK);
	}
	
	
	private Bitmap m_Bitmap = null;
	
	// Thread version:
	private void loadImage()
	{
		Log.d(LOGTAG, "loadImage()");
		enableUI(false);
	
		m_Bitmap = null;
		
		Thread thread = new Thread(new Runnable(){
				public void run()
				{
					if(m_ImagePath != null){
	            		try{
	            	      	m_MagickImage = new MagickImage(new ImageInfo(m_ImagePath));
	            		}catch (MagickException e) {
	            			Log.w(LOGTAG, "MagickException - new MagickImage", e);
	            			m_MagickImage = null;
	            			m_Bitmap = null;
	            		}
	            		if(m_MagickImage != null){
	            			try{
	            				// reduce bitmap size if needed:
	            				m_Bitmap = MagickBitmap.ToReducedBitmap(m_MagickImage, MAX_BITMAP_DIMENSION);
	            				// m_Bitmap = MagickBitmap.ToBitmap(m_MagickImage);
	            	      	}catch (MagickException e) { // will never happen
	            	      		Log.w(LOGTAG, "MagickException - ToBitmap", e);
	            	      		m_Bitmap = null; // but image is loaded
	            	      	}
	            			if(m_Bitmap == null)
	            				Log.d(LOGTAG, "ToBitmap null");
	            			else
	            				Log.d(LOGTAG, "ToBitmap ok");
	            		}
	            	}	
					
					// set as effect image, too:
        	      	m_EffectImage = m_MagickImage;
        	      	
					m_This.runOnUiThread(new Runnable(){
						public void run()
						{
							enableUI(true);
							// set no effect:
							m_SpinEffect.setSelection(0);
		            		
			            	if(m_Bitmap != null){
			            		// show image:
			            		m_ImageView.setImageBitmap(m_Bitmap);
			            		showStatus("Done");
			            		Log.d(LOGTAG, "Load success");
			            	}
			            	else{
			            		if(m_MagickImage == null){
				            		m_ImageView.setImageDrawable(getResources().getDrawable(android.R.drawable.ic_dialog_alert));
				            		showStatus("Load failed");
				            		Log.d(LOGTAG, "Load failed");
			            		}
			            		else{
			            			m_ImageView.setImageDrawable(getResources().getDrawable(android.R.drawable.gallery_thumb));
				            		showStatus("Can't display loaded image");
				            		Log.d(LOGTAG, "Can't display loaded image");
			            		}
			            	}
						}
					});
				}
			});
		
		thread.start();
	}	
	

	// AsyncTask version:
	/*
	private void loadImage()
	{
		Log.d(LOGTAG, "loadImage()");
		enableUI(false);
		
		new AsyncTask<Void, Void, Bitmap>() 
		{
            @Override
            protected Bitmap doInBackground(Void... voids) {
            	Bitmap bitmap = null;
            	
            	if(m_ImagePath != null){
            		try{
            	      	if((m_MagickImage = new MagickImage(new ImageInfo(m_ImagePath))) != null){ 
            	      		//bitmap = MagickBitmap.ToBitmap(m_MagickImage);
            	      		
            	      		// testing:
            	      		bitmap = null;
            	      		m_MagickImage = null;
            	      	}
            	      	// set as effect image, too:
            	      	m_EffectImage = m_MagickImage;
            		} catch (MagickException e) {
            		//} catch (Exception e) {
            			Log.w(LOGTAG, "image create", e);
            			m_EffectImage = null;
            			return null;
            		}
            	}	
            	
            	return bitmap;
            }

            @Override
            protected void onPostExecute(Bitmap bitmap)
            {
            	enableUI(true);
            	if(bitmap != null){
            		// set no effect:
            		m_SpinEffect.setSelection(0);
            		// show image:
            		m_ImageView.setImageBitmap(bitmap);
            		showStatus("Load ok");
            		Log.d(LOGTAG, "Load success");
            	}
            	else{
            		showStatus("Load failed");
            		Log.d(LOGTAG, "Load failed");
            	}
            }
        }.execute();
	}
	*/
	
	private void applyEffectAsync(final int pos)
	{
		Log.d(LOGTAG, "applyEffectAsync()");
		enableUI(false);
		
		new AsyncTask<Void, Void, Bitmap>() 
		{
            @Override
            protected Bitmap doInBackground(Void... voids) {
            	if(m_MagickImage != null)
            		return applyEffect(pos);
            	else
            		return null;
            }

            @Override
            protected void onPostExecute(Bitmap bitmap)
            {
            	enableUI(true);
            	
            	if(bitmap != null){
            		// show modified image:
            		m_ImageView.setImageBitmap(bitmap);
            		showStatus("Done");
            		Log.d(LOGTAG, "Effect success");
            	}
            	else{
            		showStatus("Effect failed");
            		Log.d(LOGTAG, "Effect failed");
            	}
            }
        }.execute();
	}
	
	private Bitmap applyEffect(int pos)
	{
		int effect = 0;
		Bitmap bitmap = null;
		m_EffectImage = null;
		
		Log.d(LOGTAG, "applyEffect()");
		
		try {
		switch (pos) {
		case 0:
			m_EffectImage = m_MagickImage;
			break;
		case 1:
			effect = NoiseType.UndefinedNoise;
			break;
		case 2:
			effect = NoiseType.UniformNoise;
			break;
		case 3:
			effect = NoiseType.GaussianNoise;
			break;
		case 4:
			effect = NoiseType.MultiplicativeGaussianNoise;
			break;
		case 5:
			effect = NoiseType.ImpulseNoise;
			break;
		case 6:
			effect = NoiseType.LaplacianNoise;
			break;
		case 7:
			effect = NoiseType.PoissonNoise;
			break;
		case 8:
			m_EffectImage = m_MagickImage.blurImage(5, 1);
			break;
		case 9:
			m_EffectImage = m_MagickImage.charcoalImage(5, 1);
			break;
		case 10:
			m_EffectImage = m_MagickImage.edgeImage(0);
			break;
		}
		
		if(m_EffectImage == null)
			m_EffectImage = m_MagickImage.addNoiseImage(effect);
		
		// if all else fails, default to original image:
		if(m_EffectImage == null)
			m_EffectImage = m_MagickImage;
		
		// reduce image if needed:
		bitmap = MagickBitmap.ToReducedBitmap(m_EffectImage, MAX_BITMAP_DIMENSION);
		// bitmap = MagickBitmap.ToBitmap(m_EffectImage);
		
		} catch (MagickException e) {
			Log.w(LOGTAG, "applyEffect()", e);
			bitmap = null;
		}

		return bitmap;
	}
	
	private String getRealPathFromUri(Uri contentUri)
	{
		String path = null;
		String scheme = contentUri.getScheme();
		
		if(scheme.equals("content")){
			String[] proj = { MediaStore.Images.Media.DATA };
			Cursor cursor = MediaStore.Images.Media.query(getContentResolver(), contentUri, proj, null, null, null);
			int column_index = cursor.getColumnIndexOrThrow(MediaStore.Images.Media.DATA);
			
			if(cursor != null){
				if(cursor.moveToFirst() == true)
					path = cursor.getString(column_index);
				cursor.close();
			}
			
			cursor = null;
		}
		else if(scheme.equals("file"))
			path = contentUri.getPath();

		return path;
	}

	private void showStatus(String status)
	{
		m_TextEffect.setText(status);
	}
	
	private void enableUI(boolean enable)
	{
		m_SpinEffect.setEnabled(enable);
	}
}
