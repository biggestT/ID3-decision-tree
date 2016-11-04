# Get the best attribute for classifying data set
# X: training data
# t: target attribute
# A: attributes to consider
function a = best_attribute(X, t, A)

[m n] = size(X);
maxGain = 0;

Y = X(:,t);
# Base entropy in data
Y0 = length(Y(Y==0));
Y1 = length(Y(Y==1));
EY = entropy(Y0, Y1, m);

function E = entropy(a, b, n)
  if n == 0
    E = 0;
  elseif a == 0
    E = -b/n*log2(b/n);
  elseif b == 0
    E = -a/n*log2(a/n);
  else
    E = -a/n*log2(a/n)-b/n*log2(b/n);
  endif
end

# Loop through all target attributes and see which one scores the highest information gain
for i = 1:length(A)
  
  ca = A(i);
  # column of training data corresponding to this attribute
  Xca = X(:,ca);
  # What values can this attribute take on?
  caVals = unique(Xca);
  
  gainDec = 0;
  
  ## gather up gain decrease from all different values that current attribute can take on
  for j = 1:length(caVals)
    caVal = caVals(j);
    valIdx = (Xca==caVal);
    Y0caVal = sum(Y(valIdx) == 0);
    Y1caVal = sum(Y(valIdx) == 1);
    valTot = sum(valIdx);
    gainDec = gainDec + valTot/m*entropy(Y0caVal, Y1caVal,valTot);
  end
  
  gain = EY - gainDec;

  if gain >= maxGain
    maxGain = gain;
    # set current attribute as best attribute so far
    a = ca;
  endif

endfor
end
