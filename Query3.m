
disp('Δίκτης Κατάστασης k inf')
k = norm(A,inf) * norm(inv(A),inf); % dikths katastashs k inf
disp(k)
r = b - A*x; 
disp('Σχετικό πίσω σφάλμα')
posteriori = norm(r) / (norm(A)*norm(x) + norm(b)); %sxetiko pisw sfalma
disp(posteriori)
disp('’νω φράγμα για σχετικό εμπρός σφάλμα')
sxetiko_empros_sfalma = (2*k*posteriori)/(1-(k*posteriori));
disp(sxetiko_empros_sfalma)

x_abs = A\b;
r = b - A*x_abs;  
posteriori_abs = norm(r) / (norm(A)*norm(x_abs) + norm(b));
disp('’νω φράγμα για ακριβές σχετικό εμπρός σφάλμα')
empros_sfalma_abs = (2*k*posteriori_abs)/(1-(k*posteriori_abs));
disp(empros_sfalma_abs)