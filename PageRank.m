function [R1 R2] = PageRank(nume, d, eps)

	R1 = Iterative(nume, d ,eps);
	R2 = Algebraic(nume, d);

	FILE = fopen(nume);

	nodes = str2num(fgets(FILE));

	for i = 1:nodes
		fgets(FILE);
	endfor

	val1 = str2num(fgets(FILE));
	val2 = str2num(fgets(FILE));

	a = 1 / (val2 - val1);
	b = -val1/(val2 - val1);

	u = zeros(nodes,1);
	for i = 1:nodes
		if (R2(i) >= 0 && R2(i) < val1)
			u(i, :) = [0];
		elseif (R2(i) >= val1 && R2(i) <= val2)
			u(i, :) = [a * R2(i) + b ];
		elseif (R2(i) > val2 && R2(i) <= 1)
			u(i, :) = [1];
		endif
	endfor
	
	[sorted, index] = sort(u, 1 , "descend");

	fclose(FILE);

	index = floor(index);
	nume = [nume, '.out'];

	answer = [ (1:nodes)' , index, sorted];
	fileID = fopen(nume,'a+');
	fprintf(fileID,'%d %d %f \n', answer');
	fclose(fileID);
		

endfunction
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
