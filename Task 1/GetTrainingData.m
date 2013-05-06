
function GetTrainingData(all_ftypes, np, nn)

	LoadSaveImData('TrainingImages/FACES/',  np, 'FaceData.mat');
	LoadSaveImData('TrainingImages/NFACES/', nn, 'NonFaceData.mat');
	
	ComputeSaveFData(all_ftypes, 'FeaturesToUse.mat');

end