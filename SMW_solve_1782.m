function [ x ] = SMW_solve_1782 ( A, b, M, P, Q, sdir)
    n = length(A);
    if isequal( sdir , 'colwise' )
        M = diag(diag(A));
        C = A-M;
        P = [];
        for i = 1:n
            P = [P C(:,i)];
        end
            Q = (P\C)';

    elseif isequal( sdir , 'rowwise' )
        M = diag(diag(A));
        C = A-M;
        Q = [];
        for i = 1:n
            Q = [Q ;C(i,:)];
        end
            P = C\Q;
        
    end
        m = length(P(:,1));
        A0 = M;
        x0 = A0\b;
        
        Pi = cell(m,m);
        for i = 1:m
            Pi{1,i} = A0\P(:,i); % y0,i  Mhtrwo dianismatwn sthlhs 
        end
 
        for i = 2 : m
            for j = i : m
                Pi{i,j} = Pi{i-1,j} - ((Q(:,i-1)' * (Pi{i-1,j})) / (1 + (Q(:,i-1)' * Pi{i-1,i-1})))*(Pi{i-1,i-1});
            end
        end
        
         for(i=2:m)   
            x0 = x0 - ((Q(:,i-1)' * (x0))/(1 + (Q(:,i-1)'*Pi{i-1,i-1}))) * (Pi{i-1,i-1});
         end
         
    [ x ] = x0 - ((Q(:,m)')*(x0) / (1 + (Q(:,m)' * Pi{m,m})))*(Pi{m,m});
end