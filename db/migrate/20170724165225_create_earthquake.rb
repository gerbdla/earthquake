class CreateEarthquake < ActiveRecord::Migration[5.1]
  def change
    create_table :earthquakes do |t|
      t.datetime :time
      t.string :latitude
      t.string :longitude
      t.string :depth
      t.float :mag
      t.string :mag_type
      t.string :nst
      t.string :gap
      t.string :dmin
      t.string :rms
      t.string :net
      t.string :earthquake_id
      t.string :updated
      t.string :place
      t.string :earthquake_type
      t.string :horizontal_error
      t.string :depth_error
      t.string :mag_error
      t.string :mag_nst
      t.string :status
      t.string :location_source
      t.string :mag_source
    end
  end
end
