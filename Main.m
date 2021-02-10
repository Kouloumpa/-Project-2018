clear
clc
A = MxMake_1782( 'had' , 64 );
%A = MxMake_1782( 'trihad' , 64 );
%A = MxMake_1782( 'toep' , 64 );
%A = MxMake_1782( 'mc' , 400 );
%A = MxMake_1782( 'wathen' , 12 );
%A = eye(1899)-0.85*MxMake_1782( 'CollegeMsg' , 1 );

n = length(A);
b = zeros(1,n);
M=[];
P=[];
Q=[];
for i = 1:n
    if mod(i,2) == 1
        b(1,i) = 1;
    else
        k = i ./ 2;
        p = power(-1,k+1);
        b(1,i) =  p ./ (2 * k);
    end
end
b = b'; 
x = SMW_solve_1782(A,b,M,P,Q,'colwise'); 