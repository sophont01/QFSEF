function qtfm_helpdb
% QTFM_HELPDB  Update or build qtfm help database.
%
% Copyright (c) 2016 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

% This function creates or rebuilds a searchable database of the QTFM
% documentation. Since this database works only with the version of Matlab
% that was used to build it, it is not sensible to distribute the database
% with the toolbox.

% TODO Consider whether there could be a way to invoke this from the test
% code, if the database does not exist, or from some sort of installation
% script (not currently provided for QTFM because there is nothing for such
% a script to do).

builddocsearchdb([qtfm_root filesep 'helpfiles'])

end

% $Id: qtfm_helpdb.m,v 1.3 2016/06/16 15:42:48 sangwine Exp $
