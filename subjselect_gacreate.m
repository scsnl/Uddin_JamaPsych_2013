function population = subjselect_gacreate(numSelectedSubjects,FitnessFcn,...
    options,numSubjects)

s = RandStream('mt19937ar','Seed','shuffle');
for i = 1:options.PopulationSize
    population(i,:) = datasample(s,1:numSubjects,numSelectedSubjects,'Replace',false);
end
