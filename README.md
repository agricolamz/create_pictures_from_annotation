This script extracts multiple audio together with their TextGrids from a Praat object list and extracts all non-empty fragments from the selected tiers, saving spectrum and oscilogram into separate files. Names for the files and for the captions are extracted from other tiers (word tier and utterance tier) and generated based on filenames.

The script expects to have the following tiers:

    picture tier (obligatory) -- tier that indicates wich fragment should be extracted with some non-empty annotation (for every second one fragment)
    word tier -- tier that overlaps picture tier and contains information about the word uttered in the fragment
    utterance tier -- tier that overlaps picture tier and contains information about the utterance of the word
    type tier -- tier that overlaps picture tier and contains information about the type of the object in the fragment

Only the picture tier is obligatory. All other tiers could contain nothing or point to the picture tier.

This script is distributed under the GNU General Public License. George Moroz 24.12.2018