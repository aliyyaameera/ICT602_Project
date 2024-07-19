package com.lab.projectict602;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.fragment.app.FragmentActivity;

import android.Manifest;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.lab.projectict602.databinding.ActivityMapsBinding;

import java.util.Vector;

public class MapsActivity extends FragmentActivity implements OnMapReadyCallback {

    private GoogleMap myMap;
    private ActivityMapsBinding binding;
    private String selectedState;
    private static final String BASE_URL = "http://10.20.166.198/Project602/all.php";
    private static final int LOCATION_PERMISSION_REQUEST_CODE = 200;
    private MarkerOptions marker;
    private Vector<MarkerOptions> markerOptions = new Vector<>();
    private RequestQueue requestQueue;
    private Gson gson;

    private Events[] events;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivityMapsBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        gson = new GsonBuilder().create();

        // Get the selected state from the intent
        selectedState = getIntent().getStringExtra("selectedState");

        // Obtain the SupportMapFragment and get notified when the map is ready to be used.
        SupportMapFragment mapFragment = (SupportMapFragment) getSupportFragmentManager().findFragmentById(R.id.map);
        if (mapFragment != null) {
            mapFragment.getMapAsync(this);
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == LOCATION_PERMISSION_REQUEST_CODE) {
            if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                enableMyLocation();
            } else {
                Toast.makeText(this, "Location permission denied", Toast.LENGTH_SHORT).show();
            }
        }
    }

    public void enableMyLocation() {
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION)
                == PackageManager.PERMISSION_GRANTED) {
            if (myMap != null) {
                myMap.setMyLocationEnabled(true);
                Log.d("MapsActivity", "Permission granted");
            }
        } else {
            // Permission to access the location is missing. Show rationale and request permission
            Log.d("MapsActivity", "Permission denied");
            ActivityCompat.requestPermissions(this,
                    new String[]{Manifest.permission.ACCESS_FINE_LOCATION, Manifest.permission.ACCESS_NETWORK_STATE},
                    LOCATION_PERMISSION_REQUEST_CODE);
        }
    }

    @Override
    public void onMapReady(GoogleMap googleMap) {
        myMap = googleMap;
        enableMyLocation();
        sendRequest();
        myMap.setInfoWindowAdapter(new InfoWindow(this));

    }

    public void sendRequest() {
        requestQueue = Volley.newRequestQueue(getApplicationContext());
        String urlWithParams = BASE_URL + "?state=" + selectedState;
        StringRequest stringRequest = new StringRequest(Request.Method.GET, urlWithParams, onSuccess, onError);
        requestQueue.add(stringRequest);
    }

    public Response.Listener<String> onSuccess = new Response.Listener<String>() {
        @Override
        public void onResponse(String response) {
            events = gson.fromJson(response, new TypeToken<Events[]>() {}.getType());

            if (events == null || events.length == 0) {
                Log.d("MapsActivity", "No events found");
                Toast.makeText(getApplicationContext(), "No events found for the selected state", Toast.LENGTH_LONG).show();
                return;
            }

            Log.d("MapsActivity", "Number of Events Data Point: " + events.length);

            LatLng firstEventLocation = null;

            for (Events info : events) {
                Double lat = Double.parseDouble(info.getLatitude());
                Double lng = Double.parseDouble(info.getLongitude());
                String title = info.getName();
                String date = info.getDate();
                String time = info.getTime();
                String ticket = info.getTicket();

                MarkerOptions marker = new MarkerOptions().position(new LatLng(lat, lng))
                        .title(title)
                        .snippet("Date: " + date + "\nTime: " + time + "\nTicket: " + ticket)
                        .icon(BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_BLUE));

                myMap.addMarker(marker);

                if (firstEventLocation == null) {
                    firstEventLocation = new LatLng(lat, lng);
                }
            }

            if (firstEventLocation != null) {
                myMap.moveCamera(CameraUpdateFactory.newLatLngZoom(firstEventLocation, 12));
            }
        }
    };

    public Response.ErrorListener onError = new Response.ErrorListener() {
        @Override
        public void onErrorResponse(VolleyError volleyError) {
            Log.e("MapsActivity", "Error: " + volleyError.getMessage());
            Toast.makeText(getApplicationContext(), "Failed to retrieve data", Toast.LENGTH_LONG).show();
        }
    };
}
