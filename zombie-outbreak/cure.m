% Function that controls the release of cure in models.
% Input parameters:
%   day - day of cure release
%   t   – current time state of simulation
function cure = cure(t, day)
  if t >= day
    cure = 1;
  else
    cure = 0;
  endif
endfunction
