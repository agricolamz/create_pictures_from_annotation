is script takes multiple audio and TextGrids from Praat object list and extract all non-empty fragments from the selected tier, save to seperate files spectrum and oscilogram.  Names for the files and for the picture title are taken from other tiers (word tier and utterance tier) and filenames.

The script expects to have following tiers:

* *picture tier* (obligatory) -- tier that indicates wich fragment should be drawn with some non-empty annotation (for every second one fragment)
* *word tier* -- tier that overlap *picture tier* and contains information about the word spoken in the fragment
* *utterance tier* -- tier that overlap *picture tier* and contains information about the utterance of the word
* *type tier* -- tier that overlap *picture tier* and contains information about the type of the object in the fragment

Only *picture tier* is obligatory. All others could contain nothing or point to the *picture tier*.

This script is distributed under the GNU General Public License.
George Moroz 24.12.2018