function R = Algebraic(nume, d)
	%citire
	File = fopen(nume);
	nodeCount = str2num(fgets(File));

	A = zeros(nodeCount, nodeCount);
	K_inv = zeros(nodeCount, nodeCount);
	PR = zeros(nodeCount, 1);

	for i = 1:nodeCount 
		neighbours = str2num(fgets(File));
		repeated = find(~(neighbours(1,3:end) - neighbours(1)));
		A(neighbours(1), neighbours(1,3:end)) = 1;
		if(repeated)
			A(i,i) = 0;
		endif
		
		K_inv(i, i) = 1/(neighbours(2) - sum(repeated != 0));
	endfor
	
	T = eye(nodeCount,nodeCount) - d*((K_inv * A)');
	[Q R] = Gram_Schmidt(T);
	T_inv = zeros(nodeCount, nodeCount);
	Q = Q';

	for i = 1:nodeCount
		T_inv(:, i) = SST(R, Q(:, i));
	endfor
	
	R = (T_inv) * (1 - d)/nodeCount * ones(nodeCount,1);

endfunction
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
	