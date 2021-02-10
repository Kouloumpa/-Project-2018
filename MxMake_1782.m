function [ A ] = MxMake_1782(mx_id , n)
    if isequal( mx_id , 'had' )
        A = hadamard(n);
    
    elseif isequal ( mx_id , 'trihad')
        A = hadamard(n);
        A = triu(A);
        
    elseif isequal ( mx_id , 'toep')
        A = toeplitz([4,-1,zeros(1,n-2)]);
        
    elseif isequal ( mx_id , 'mc')
        for i = 1:n
            for j = 1:n
                if i == j
                    A(i,j) = 1 + i;
                else 
                    A(i,j) = 1 / (i-j).^2;
                end
            end
        end
        
    elseif isequal ( mx_id , 'wathen')
        m = 11;
        A = gallery('wathen',n,m);
        
    elseif isequal ( mx_id , 'CollegeMsg')
        b = load('CollegeMsg.mat');
        A = b.Problem.A;
    
    end   
end
