function [R] = Iterative(nume, d, eps)

	%citire
	File = fopen(nume);
	nodeCount = str2num(fgets(File));

	A = zeros(nodeCount, nodeCount);
	K_inv = zeros(nodeCount, nodeCount);
	M = zeros(nodeCount, nodeCount);
	R_prev = ones(nodeCount, 1)/nodeCount;
	R = zeros(nodeCount, 1);

	for i = 1:nodeCount 
		neighbours = str2num(fgets(File));
		repeated = find(~(neighbours(1,3:end) - neighbours(1)));
		A(neighbours(1), neighbours(1,3:end)) = 1;
		if(repeated)
			A(i,i) = 0;
		endif
		
		K_inv(i, i) = 1/(neighbours(2) - sum(repeated != 0));
	endfor
	
	M = (K_inv * A)';

	while (1)
		R = d * M * R_prev + ((1 - d)/double(nodeCount)) * ones(nodeCount, 1);
		if(abs(R - R_prev) < eps)
			break;	
		endif
		R_prev = R;
	endwhile
	
endfunction
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 