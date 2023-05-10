# Dictionary for /data tables

## Overview

This folder holds CSV tables used for inputting data into the DB. There are 15 tables of data. These are stored in .csv files. These were imported into an SQLite database (old_kingdom_musical_ensemble_scenes.db) after running the creation statement in *add later*/create_tables.sql via create_database.sh.

These tables hold various types of iconographical, textual, geographic, typological, and referential data related to the corpus of 101 musical ensemble scenes from Old Kingdom Egypt.

## The Tables

Key:
**primary key**
*foreign key*

The **15** data tables and their columns are:

### 1. Location
* Location_ID
* Site
* Cemetery
* Country
* Latitude
* Longitude
* Pleiades_Entry
2. **Reign**
* Reign
* Sort_Order
* Dynasty
3. **Chronology**
* Chronology_ID
* Period_Start
* Period_End
* Dynasty_Start
* Dynasty_End
* Reign_Start
* Reign_End
4. **Tomb**
* Tomb_ID
* Location_ID
* Chronology_ID
* Appellation
5. **Tomb_Number**
* MilitaryStatusID
* FirstRecordedOffice
* SecondRecordedOffice
* FirstOfficeCertainty
* SecondOfficeCertainty
* VeteranStatus
* VeteranStatusCertainty
6. **OEE_Scene_Detail**
* MonumentID
* FindSpotID
* MonumentSpecificFindspotNote
* PublicationCitation
* DateFoundOrPublished
* DateFoundorPublishedPrecisionNote
* MonumentType
* MonumentOfSeventhLegion
* Inscription
* Translation
* TranslationSource
* LowerFieldDecoration
* LowerFieldDetail
* Portrait
* Frieze
* DateFrom
* DateTo
* DateNote
* Tončinić2011StelaeType
* ModernHolding
* HoldingData
* MonumentNote
* DBInclusionReason
* Media
7. **OEE_Scene**
* MonumentCorpusID
* MonumentID
* CorpusName
* Reference
* isPrimaryReference
8. **Scene**
* MonumentServicemanID
* ServicemanID
* MonumentID
* ServicemanReferencedAs
* PossibleDuplicateServicemanID
* SourceForDuplicateArgument
9. **Reference**
* UnitID
* UnitTitle
