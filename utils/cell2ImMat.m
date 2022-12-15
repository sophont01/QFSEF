function C = cell2ImMat(Icell)
C = [];
for i=1:numel(Icell)
    C = cat(4,C,Icell{i});
end
end
