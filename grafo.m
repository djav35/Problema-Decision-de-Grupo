function grafo(varargin)

M = varargin{1};

for k = 2:nargin
  E = varargin{k};
  M = M | E;
end

names = compose("A%d",(1:length(M)));
G = digraph(M, names,'omitselfloops');
plot(G,'Layout','force')
return 