function errorRate = subjselect_gafit(subjectIndices,...
    data, var_names, var_type, var_mean, var_std, var_priority)


var_n = length(var_names);

errorRate = 0;
for ithvar = 1:var_n
    if(strcmpi(var_names{ithvar},'pid') == 1)
            PIDRepeated = 0;
            if(length(subjectIndices) ~= length(unique(data(subjectIndices,ithvar)))) PIDRepeated = 1; end
            errorRate = errorRate + 10000*PIDRepeated;
            continue
	end

	if(var_type(ithvar) == 1)
        if(var_mean(ithvar) ~= 0)
    		errorRate = errorRate + (abs(mean(data(subjectIndices,ithvar)) - var_mean(ithvar)))*var_priority(ithvar) + (abs(std(data(subjectIndices,ithvar)) - var_std(ithvar)));		
        end
	end

	if(var_type(ithvar) == 2)
        var_discrete_1 = length(find(data(subjectIndices,ithvar) == 1));
        var_discrete_0 = length(find(data(subjectIndices,ithvar) == 0));
		var_discrete_ratio = var_discrete_1/var_discrete_0;
		errorRate = errorRate + (abs(var_discrete_ratio - var_mean(ithvar)))*var_priority(ithvar); 		
	end
end
