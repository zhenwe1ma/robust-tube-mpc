clear;
% linear
A = [1 1; 0 1];
B = [0.5; 1]; 
Q = diag([1, 1]);
R = 0.1;
mysys = LinearSystem(A, B, Q, R);
Xc_vertex = [2, -2; 2 2; -10 2; -10 -2];
Uc_vertex = [1; -1];

Xc = Polyhedron(Xc_vertex);
Uc = Polyhedron(Uc_vertex);

mpi = mysys.compute_MPIset(Xc, Uc);
x = [-1;0]
for i = 1:15
    u_next = mysys.K*x;
    x = mysys.propagate(x, u_next) % + add some noise here
    pause(0.1);
    % plot(mpi)
    % hold on
    % plot(x)
    clf;
end