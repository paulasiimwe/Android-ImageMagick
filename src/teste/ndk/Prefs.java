package teste.ndk;

import android.content.Context;
import android.content.SharedPreferences;

import org.json.JSONArray;
import org.json.JSONException;

import java.util.ArrayList;
import java.util.Set;

/**
 * Prefs.java
 *
 * Created by D.Slamnig on 8/20/2015.
 *
 * Utility class for storing/retrieving shared preferences.
 */

public class Prefs
{
    private SharedPreferences m_Prefs;

    // option keys:
    private static final String PREFS_NAME = "AndroidImageMagickPrefs";

    private static final String FOLDER_KEY = "Folder";
    private static final String FILENAME_KEY = "Filename";
    private static final String FILTERID_KEY = "FilterIdKey";
    private static final String IMAGEPATH_KEY = "ImagePath";
    
    public Prefs(Context context)
    {
        m_Prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    public int getFilterId()
    {
        return getOptionInt(FILTERID_KEY, 0);
    }

    public void setFilterId(int filterId)
    {
        setOptionInt(FILTERID_KEY, filterId);
    }
    
    public String getFolder()
    {
    	return getOptionString(FOLDER_KEY, "Magick");
    }
    
    public void setFolder(String folder)
    {
    	setOptionString(FOLDER_KEY, folder);
    }
    
    public String getFilename()
    {
    	return getOptionString(FILENAME_KEY, "test");
    }
    
    public void setFilename(String filename)
    {
    	setOptionString(FILENAME_KEY, filename);
    }
    
    public String getImagePath()
    {
    	return getOptionString(IMAGEPATH_KEY, null);
    }
    
    public void setImagePath(String imagePath)
    {
    	setOptionString(IMAGEPATH_KEY, imagePath);
    }
   
    ////////////////////
    // general:

    private void setOptionBool(String key, boolean set)
    {
        SharedPreferences.Editor ed = m_Prefs.edit();

        ed.putBoolean(key, set);
        ed.commit();
    }

    private boolean getOptionBool(String key, boolean defSet)
    {
        return m_Prefs.getBoolean(key, defSet);
    }

    private void setOptionInt(String key, int val)
    {
        SharedPreferences.Editor ed = m_Prefs.edit();

        ed.putInt(key, val);
        ed.commit();
    }

    private int getOptionInt(String key, int defVal)
    {
        return m_Prefs.getInt(key, defVal);
    }

    private void setOptionLong(String key, long val)
    {
        SharedPreferences.Editor ed = m_Prefs.edit();

        ed.putLong(key, val);
        ed.commit();
    }

    private long getOptionLong(String key, long defVal)
    {
        return m_Prefs.getLong(key, defVal);
    }

    private void setOptionFloat(String key, float val)
    {
        SharedPreferences.Editor ed = m_Prefs.edit();

        ed.putFloat(key, val);
        ed.commit();
    }

    private float getOptionFloat(String key, float defVal)
    {
        return m_Prefs.getFloat(key, defVal);
    }
    
    private void setOptionString(String key, String val)
    {
    	SharedPreferences.Editor ed = m_Prefs.edit();

        ed.putString(key, val);
        ed.commit();
    }
    
    private String getOptionString(String key, String defVal)
    {
        return m_Prefs.getString(key, defVal);
    }

    private void setOptionIntArray(String key, ArrayList<Integer> values)
    {
        SharedPreferences.Editor ed = m_Prefs.edit();
        JSONArray a = new JSONArray();

        //for (int i = 0; i < values.size(); i++) {
        //    a.put(values.get(i));
        //}
        if(values != null && !values.isEmpty()) {
            for (int i = 0; i < values.size(); i++) {
                a.put(values.get(i));
            }
            ed.putString(key, a.toString());
        } else {
            ed.putString(key, null);
        }

        ed.commit();
    }

    private ArrayList<Integer> getOptionIntArray(String key)
    {
        String json = m_Prefs.getString(key, null);
        ArrayList<Integer> values = new ArrayList<Integer>();

        if (json != null) {
            try {
                JSONArray a = new JSONArray(json);
                for (int i = 0; i < a.length(); i++) {
                    Integer val = a.optInt(i);
                    values.add(val);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }

        return values;
    }

    private void setOptionStringSet(String key, Set<String> values)
    {
        SharedPreferences.Editor ed = m_Prefs.edit();

        ed.putStringSet(key, values);
        ed.commit();
    }

    private Set<String> getOptionStringSet(String key)
    {
        Set<String> set = null;

        try{
            set = m_Prefs.getStringSet(key, null);
        }catch(ClassCastException e){
            set = null;
        }

        return set;
    }
}

