#!/usr/bin/env bash

# Stop on error
set -euo pipefail

# remove the directory temporary_files if it exists
rm -rf csv_files

# make the directory temporary_fiels
mkdir csv_files

# Find all of the sheets in our excel file
for sheet in $(in2csv --names OK_musical_ensemble_scenes.xlsx); do
#Tell the human what we're doing
echo making $sheet
# change a sheet into a csv
in2csv  --quoting 2 --sheet "$sheet" OK_musical_ensemble_scenes.xlsx > "${sheet}.csv"
# tail -n2 "${sheet}.csv"
# remove the header row from the csv
tail -n +2 "$sheet.csv" > "$sheet.tmp" && mv "$sheet.tmp" "csv_files/$sheet.csv"
# remove the unused sheet.csv
rm "$sheet.csv"
done

# cd "OneDrive - Macquarie University"/MRes_Thesis_Data/Data
# Run create_tables.sql to make the database
sqlite3 old_kingdom_musical_ensemble_scenes.db < "create_tables.sql"
#rm *.csv
