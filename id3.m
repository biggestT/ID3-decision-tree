function id3 (filename, target_attribute, input_attributes)

D = csvread(filename, 1, 0);

## Get attribute names
aNames = textread(filename, '%s', 1);
aNames = regexp(aNames{1}, ',', 'split');

tree(D, target_attribute, input_attributes, -3, aNames);

function tree (D, t, A, l, aNames)
  
  level = l + 3;
  total = length(D);
  trues = length(D(D(:,t)==1));
  falses = length(D(D(:,t)==0));
  
  ## Does all examples belong to one class?
  if trues == 0
    disp([blanks(level) 'not ' aNames{t}])
  elseif falses == 0
    disp([blanks(level) aNames{t}])
  
  ## Are we out of attributes?
  elseif length(A) == 0
    if trues > falses
      disp([blanks(level) aNames{t} ' most likely (' sprintf('%2.0f',100*trues/total) '%)']);
    else
      disp([blanks(level) 'not ' aNames{t} ' most likely (' sprintf('%2.0f',100*falses/total) '%)']);
    endif

  ## Keep on building tree
  else
    a = best_attribute(D, t, A);
    ## remove chosen attribute
    Anew = A(A!=a);
    Dca = D(:,a);
    caVals = unique(D(:,a));
    for j = 1:length(caVals)
      caVal = caVals(j);
      subD = D(D(:,a)==caVal,:);
      truesSubD = length(subD(subD(:,t)==1));
      disp([blanks(level) aNames{a} ' value: ' num2str(caVal) ' (' sprintf('%2.0f',100*length(subD)/total) '%)']);
      if length(subD) == 0 
        disp('no more examples')
      else
        tree(subD, t, Anew, level, aNames);
      endif
    endfor  
  endif
end
end


