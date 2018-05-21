package teste.ndk;

import java.io.File;

import fakeawt.Dimension;

import magick.CompressionType;
import magick.ImageInfo;
import magick.MagickException;
import magick.MagickImage;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.AsyncTask;
import android.os.Environment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

//
//	2016/04/04 D.Slamnig created
//

public class ExportDialog 
{
	private static final String LOGTAG = "ExportDialog.java";
	private static final String SDCARD_ROOT =
            Environment.getExternalStorageDirectory().toString();

	private MagickImage m_Image = null;

	private AndroidMagickActivity m_Activity;
	private AlertDialog m_Dlg = null;
	
	private TextView m_TextPath;
	private Spinner m_SpinFormat;
	private EditText m_EditFolder;
	private EditText m_EditName;
	private Button m_ButExport;
	private TextView m_TextExport;
	
	private Prefs m_Prefs;

	public ExportDialog(AndroidMagickActivity activity)
	{
		m_Activity = activity;
		m_Prefs = new Prefs(activity);
	}

	public void show(MagickImage image)
	{
		m_Image = image;
		LayoutInflater inflater = LayoutInflater.from(m_Activity);
		View layout = inflater.inflate(R.layout.dialog_export, null);

		m_TextPath = (TextView)layout.findViewById(R.id.textPath);
		m_SpinFormat = (Spinner)layout.findViewById(R.id.spinFormat);
		m_EditFolder = (EditText)layout.findViewById(R.id.editFolder);
		m_EditName = (EditText)layout.findViewById(R.id.editName);
		m_ButExport = (Button)layout.findViewById(R.id.butExport);
		m_TextExport = (TextView)layout.findViewById(R.id.textExport);
		
		ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(m_Activity,
				R.array.formats, android.R.layout.simple_spinner_item);
		
		adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		m_SpinFormat.setAdapter(adapter);
		
		m_ButExport.setOnClickListener(new OnClickListener(){
			@Override
			public void onClick(View v) {
				if(m_Image != null)
					export();
			}});
		
		AlertDialog.Builder builder = new AlertDialog.Builder(m_Activity);
		builder.setView(layout);
		builder.setCancelable(true);

		builder.setOnCancelListener(new DialogInterface.OnCancelListener() {
	            public void onCancel(DialogInterface dialog) {
	            	saveState();
	                m_Dlg = null;
	            }
	        });
		
		m_Dlg = builder.create();
		m_Dlg.setCanceledOnTouchOutside(false);
		m_Dlg.show();
		
		showDetails();
		restoreState();
	}
	
	private void showDetails()
	{
		String path, details;
		long fileSize;
		
		if(m_Image == null)
			details = "No image";
		else{
			try{
				path = m_Image.getFileName();
				File file = new File(path);
				fileSize = file.length();
				details = path + "\nSize: " + (fileSize / 1024) + " K";
			}catch(MagickException e){
				Log.w(LOGTAG, "showDetails()", e);
				details = "Image error";
			}
		}
		
		m_TextPath.setText(details);
	}
	
	private void export()
	{
		String folder = m_EditFolder.getText().toString();
		String name = m_EditName.getText().toString();
		String ext = (String)m_SpinFormat.getSelectedItem();
		
		folder = folder.trim();
		name = name.trim();
		
		if(name.length() == 0){
			showStatus("Please enter filename");
			enableUI(true);
			return;
		}
		
		// if not sdcard root, make sure output folder exists:
		if(folder.length() > 0){
			File file = new File(SDCARD_ROOT + "/" + folder);
			file.mkdirs();
		}
		
		String outPath = SDCARD_ROOT + "/" + folder + "/" + name + "." + ext;
		
		showStatus("Exporting:\n" + outPath);
		enableUI(false);
		saveState();
		
		exportAsync(m_Image, outPath);
	}
	
	private void exportAsync(final MagickImage image, final String outPath)
	{
		new AsyncTask<Void, Void, Boolean>() 
		{
            @Override
            protected Boolean doInBackground(Void... voids) {
                return exportImage(image, outPath);
            }

            @Override
            protected void onPostExecute(Boolean ret)
            {
            	if(ret == true){
            		showStatus("Done\n" + outPath);
            		Log.d(LOGTAG, "Export success");
            	}
            	else{
            		showStatus("Export failed!\n" + outPath);
            		Log.d(LOGTAG, "Export failed");
            	}
            	enableUI(true);
            }
        }.execute();
	}
	
	private boolean exportImage(MagickImage image, String outPath)
	{
		try{
			// set output format through file extension:
			image.setFileName(outPath);
			// set compression explicitly - fix for segmentation bug:
			image.setCompression(CompressionType.JPEG2000Compression);
			// write file
			image.writeImage(new ImageInfo());
		} catch (MagickException e) {	
			Log.w(LOGTAG, "export()", e);
			return false;
		}
		
		return true;
	}
	
	// This exports directly from file to file:
	private boolean exportFile(String inPath, String outPath)
	{
		try{
			// create MagickImage that converts format:
			ImageInfo info = new ImageInfo(inPath);
			MagickImage magick_converter = new MagickImage(info); 
			// set output format through file extension:
			magick_converter.setFileName(outPath);
			// set compression explicitly - fix for segmentation bug:
			magick_converter.setCompression(CompressionType.JPEG2000Compression);
			// write file
			magick_converter.writeImage(info);
		} catch (MagickException e) {
			Log.w(LOGTAG, "export()", e);
			return false;
		}
		
		return true;
	}
	
	private void showStatus(String status)
	{
		m_TextExport.setText(status);
	}
	
	private void enableUI(boolean enable)
	{
		m_SpinFormat.setEnabled(enable);
		m_ButExport.setEnabled(enable);
	}
	
	private void saveState()
	{
		m_Prefs.setFilterId(m_SpinFormat.getSelectedItemPosition());
		m_Prefs.setFolder(m_EditFolder.getText().toString());
		m_Prefs.setFilename(m_EditName.getText().toString());
	}
	
	private void restoreState()
	{
		m_SpinFormat.setSelection(m_Prefs.getFilterId());
		m_EditFolder.setText(m_Prefs.getFolder());
		m_EditName.setText(m_Prefs.getFilename());
	}
}
