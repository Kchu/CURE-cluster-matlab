function D=dis2(XT,XR)
% Compute the distance between XT and XR.

[n1,~] = size(XT);
[n2,~] = size(XR);
XT2 = sum(XT.^2,2);
XR2 = sum(XR.^2,2);
d2 = repmat(XT2,1,n2) + repmat(XR2',n1,1) - 2 * (XT*XR');
D=d2.^(1/2);
D = real(D);
end