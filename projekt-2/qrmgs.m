function [Q,R]=qrmgs(A)
%rozkład QR (wąski) zmodyfikowanym algorytmem Grama-Schmidta
%dla macierzy prostokątnych rzeczywistych i zespolonych
[m, n]=size(A);
Q=zeros(m,n);
R=zeros(n,n);
d=zeros(1,n);

%rozkład z kolumnami Q ortogonalnymi (nie ortonormalnymi):
for i=1:n
    Q(:,i)=A(:,i);
    R(i,i)=1;
    d(i)=Q(:,i)'*Q(:,i);
    for j=i+1:n
        R(i,j)=(Q(:,i)'*A(:,j))/d(i);
        A(:,j)=A(:,j)-R(i,j)*Q(:,i);
    end
end

%normowanie rozkładu (kolumny Q ortonormalne):
for i=1:n
    dd=norm(Q(:,i));
    Q(:,i)=Q(:,i)/dd;
    R(i,i:n)=R(i,i:n)*dd;
end