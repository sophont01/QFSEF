function [outE] = groupLayers(I, E, cfg)

fullEnergy = sum(I(:));
thresh = cfg.minThresh*fullEnergy;
f_lowE = true;

outE = procE(E,thresh);
end


function[outE] = procE(inE,thresh)
outE = {};
i=1;
while i<=numel(inE)
    f_lowE = (sum(inE{i}(:))<thresh);
    if isempty(inE{i})
        inE(i) = [];
        i=i+1;
        continue;
    end
    if f_lowE && (i<numel(inE)) && ~isempty(inE{i+1})
        outE{end+1} = inE{i}+inE{i+1};
        i = i+1;
    elseif f_lowE && (i==numel(inE)) %&& ~isempty(inE{i})
        outE{end} = inE{i}+outE{end};
    else
        outE{end+1} = inE{i};
    end
    i=i+1;
end

f_lowEall = cell2mat(arrayfun(@(x) (sum(outE{x}(:)) < thresh), 1:numel(outE),'UniformOutput', false ));
f_lowE = any(f_lowEall);
if f_lowE, outE = procE(outE ,thresh);  end
end