# This script is distributed under the GNU General Public License.
# George Moroz 24.12.2018

form Get spectrum and oscilogram from 
  comment Where should the script write a result files?
  text directory /home/agricolamz/work/scripts/praat/create_pictures_from_annotation/
  comment Which tier is the basis for picture frame?
  integer picturetier 3
  comment Which tier is a word tier?
  integer wordtier 6
  comment Which tier is a utterance tier?
  integer utterancetier 5
  comment Which tier is a type tier?
  integer typetier 2
endform

n = numberOfSelected("Sound")
for j to n
	sound[j] = selected("Sound", j)
endfor
for k to n
	selectObject: sound[k]
	object_name$ = selected$ ("Sound")
	select TextGrid 'object_name$'
	number_of_intervals = Count intervals where: 'picturetier', "is not equal to", ""
	for b to number_of_intervals
		select TextGrid 'object_name$'
		interval_label$ = Get label of interval... 'picturetier' b*2
		if interval_label$ <> ""
			end = Get end point... 'picturetier' b*2
			end = end - 0.001
			word_int = Get interval at time: 'wordtier', 'end'
			words$[b] = Get label of interval... 'wordtier' 'word_int'
			utterance_int = Get interval at time: 'utterancetier', 'end'
			utterances$[b] = Get label of interval... 'utterancetier' 'utterance_int'
			type_int = Get interval at time: 'typetier', 'end'
			types$[b] = Get label of interval... 'typetier' 'type_int'
		endif
	endfor
	plusObject: sound[k]
	Extract non-empty intervals: 'picturetier', "no"
	for b to number_of_intervals
		extracted[b] = selected("Sound", b)
	endfor
	for id to number_of_intervals
		selectObject: extracted[id]
		To Spectrogram: 0.005, 5000, 0.002, 20, "Gaussian"
		Select outer viewport: 0, 10, 3, 10
		Paint: 0, 0, 0, 0, 100, "yes", 50, 6, 0, "yes"
		Remove
		selectObject: extracted[id]
		Select outer viewport: 0, 10, 0, 3.5
		Draw: 0, 0, 0, 0, "yes", "Curve"
		Select outer viewport: 0, 10, 0, 10
		Text top: "yes", object_name$ + " "+ words$[id] + " "+ utterances$[id] + " " + types$[id]
		Save as 300-dpi PNG file: directory$+object_name$+"_"+ words$[id] + "_"+ utterances$[id] + "_" + types$[id]+".png"
		Erase all
		Remove
	endfor
endfor