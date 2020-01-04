function out = model
%
% smf28_sellmeier_water_old.m
%
% Model exported on Apr 7 2014, 16:54 by COMSOL 4.3.2.189.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Users\Maxime\Documents\smf-28\models\old');

model.name('smf-28-sellmeier-water-freq.mph');

model.param.set('CORE_RADIUS', '4.1 [um]');
model.param.set('CLADDING_RADIUS', '62.5 [um]');
model.param.set('EXTERIOR_RADIUS', 'CLADDING_RADIUS + 20 [um]');
model.param.set('N_CORE', '1.448701601');
model.param.set('N_CLADDING', '1.444023625');
model.param.set('N_WATER', '1.327292175');
model.param.set('FREE_SPACE_WAVELENGTH', '1.55 [um]');
model.param.set('FREQUENCY', 'c_const/FREE_SPACE_WAVELENGTH');
model.param.name('Global Model Parameters');

model.modelNode.create('mod2');
model.modelNode('mod2').name('SMF-28 in Water (Sellmeier Dispersion Model)');
model.modelNode('mod2').identifier('model');

model.geom.create('geom2', 2);
model.geom('geom2').lengthUnit([native2unicode(hex2dec('00b5'), 'Cp1252') 'm']);
model.geom('geom2').scaleUnitValue(true);
model.geom('geom2').feature.create('c1', 'Circle');
model.geom('geom2').feature.create('c2', 'Circle');
model.geom('geom2').feature.create('c3', 'Circle');
model.geom('geom2').name('SMF-28 (Water) Geometry');
model.geom('geom2').feature('c1').name('Core');
model.geom('geom2').feature('c1').set('r', 'CORE_RADIUS');
model.geom('geom2').feature('c1').set('pos', {'0' '0'});
model.geom('geom2').feature('c2').name('Cladding');
model.geom('geom2').feature('c2').set('r', 'CLADDING_RADIUS');
model.geom('geom2').feature('c2').set('pos', {'0' '0'});
model.geom('geom2').feature('c3').name('Exterior');
model.geom('geom2').feature('c3').set('r', 'EXTERIOR_RADIUS');
model.geom('geom2').run;

model.selection.create('sel1', 'Explicit');
model.selection('sel1').set([1 2 3]);
model.selection.create('sel2', 'Explicit');
model.selection('sel2').set([1 2 3]);
model.selection.create('sel3', 'Explicit');
model.selection('sel3').set([1 2 3]);

model.view('view1').tag('view2');
model.view.create('view3', 3);

model.material.create('mat4');
model.material('mat4').propertyGroup.create('RefractiveIndex', 'Refractive index');
model.material('mat4').selection.set([3]);
model.material.create('mat5');
model.material('mat5').propertyGroup.create('RefractiveIndex', 'Refractive index');
model.material('mat5').selection.set([2]);
model.material.create('mat6');
model.material('mat6').propertyGroup.create('RefractiveIndex', 'Refractive index');
model.material('mat6').selection.set([1]);

model.physics.create('ewfd2', 'ElectromagneticWavesFrequencyDomain', 'geom2');
model.physics('ewfd2').field('electricfield').field('E2');
model.physics('ewfd2').field('electricfield').component({'E2x' 'E2y' 'E2z'});
model.physics('ewfd2').feature.create('wee2', 'WaveEquationElectric', 2);
model.physics('ewfd2').feature('wee2').selection.set([3]);
model.physics('ewfd2').feature.create('wee3', 'WaveEquationElectric', 2);
model.physics('ewfd2').feature('wee3').selection.set([1]);
model.physics('ewfd2').feature.create('wee4', 'WaveEquationElectric', 2);
model.physics('ewfd2').feature('wee4').selection.set([2]);

model.mesh.create('mesh2', 'geom2');
model.mesh('mesh2').feature.create('ftri1', 'FreeTri');
model.mesh('mesh2').feature('ftri1').feature.create('size1', 'Size');
model.mesh('mesh2').feature('ftri1').feature.create('size2', 'Size');
model.mesh('mesh2').feature('ftri1').feature.create('size3', 'Size');
model.mesh('mesh2').feature('ftri1').feature('size1').selection.geom('geom2', 2);
model.mesh('mesh2').feature('ftri1').feature('size1').selection.set([3]);
model.mesh('mesh2').feature('ftri1').feature('size2').selection.geom('geom2', 2);
model.mesh('mesh2').feature('ftri1').feature('size2').selection.set([2]);
model.mesh('mesh2').feature('ftri1').feature('size3').selection.geom('geom2', 2);
model.mesh('mesh2').feature('ftri1').feature('size3').selection.set([1]);

model.frame('material1').tag('material2');

model.coordSystem('sys1').tag('sys2');

model.view('view2').name('View');
model.view('view2').axis.set('xmin', '-137.51580810546875');
model.view('view2').axis.set('ymin', '-90.75');
model.view('view2').axis.set('xmax', '137.51580810546875');
model.view('view2').axis.set('ymax', '90.75');

model.material('mat4').name('Core (Doped Silica Glass)');
model.material('mat4').propertyGroup('RefractiveIndex').set('n', '');
model.material('mat4').propertyGroup('RefractiveIndex').set('ki', '');
model.material('mat4').propertyGroup('RefractiveIndex').set('n', {'N_CORE' '0' '0' '0' 'N_CORE' '0' '0' '0' 'N_CORE'});
model.material('mat4').propertyGroup('RefractiveIndex').set('ki', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
model.material('mat5').name('Cladding (Silica Glass)');
model.material('mat5').propertyGroup('RefractiveIndex').set('n', '');
model.material('mat5').propertyGroup('RefractiveIndex').set('ki', '');
model.material('mat5').propertyGroup('RefractiveIndex').set('n', {'N_CLADDING' '0' '0' '0' 'N_CLADDING' '0' '0' '0' 'N_CLADDING'});
model.material('mat5').propertyGroup('RefractiveIndex').set('ki', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
model.material('mat6').name('Exterior (Water)');
model.material('mat6').propertyGroup('RefractiveIndex').set('n', '');
model.material('mat6').propertyGroup('RefractiveIndex').set('ki', '');
model.material('mat6').propertyGroup('RefractiveIndex').set('n', {'N_WATER' '0' '0' '0' 'N_WATER' '0' '0' '0' 'N_WATER'});
model.material('mat6').propertyGroup('RefractiveIndex').set('ki', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});

model.physics('ewfd2').name('Electromagnetic Waves, Frequency Domain');
model.physics('ewfd2').feature('wee1').set('coeffB', {'0.7028554'; '0.4146307'; '0.897454'});
model.physics('ewfd2').feature('wee1').set('coeffC', {'0.0727723 [um]'; '0.1143085 [um]'; '9.896161 [um]'});
model.physics('ewfd2').feature('wee1').set('materialType', 'from_mat');
model.physics('ewfd2').feature('wee1').name('Wave Equation, Electric');
model.physics('ewfd2').feature('wee2').set('DisplacementFieldModel', 'SellmeierDispersionModel');
model.physics('ewfd2').feature('wee2').set('coeffB', {'0.7028554'; '0.4146307'; '0.897454'});
model.physics('ewfd2').feature('wee2').set('coeffC', {'(0.0727723 [um])^2'; '(0.1143085 [um])^2'; '(9.896161 [um])^2'});
model.physics('ewfd2').feature('wee2').set('materialType', 'from_mat');
model.physics('ewfd2').feature('wee2').name('Sellmeier Core');
model.physics('ewfd2').feature('wee3').set('DisplacementFieldModel', 'SellmeierDispersionModel');
model.physics('ewfd2').feature('wee3').set('coeffB', {'0.5689094'; '0.1719709'; '0.02062502'});
model.physics('ewfd2').feature('wee3').set('coeffC', {'(0.005110302 [um])^2'; '(0.05110302 [um])^2'; '(0.02624159 [um])^2'});
model.physics('ewfd2').feature('wee3').name('Sellmeier Exterior');
model.physics('ewfd2').feature('wee4').set('DisplacementFieldModel', 'SellmeierDispersionModel');
model.physics('ewfd2').feature('wee4').set('coeffB', {'0.6961663'; '0.4079426'; '0.8974790'});
model.physics('ewfd2').feature('wee4').set('coeffC', {'(0.06840430 [um])^2'; '(0.1162414 [um])^2'; '(9.896161 [um])^2'});
model.physics('ewfd2').feature('wee4').name('Sellmeier Cladding');

model.mesh('mesh2').name('Mesh');
model.mesh('mesh2').feature('size').set('custom', 'on');
model.mesh('mesh2').feature('ftri1').feature('size1').name('Core Mesh');
model.mesh('mesh2').feature('ftri1').feature('size1').set('hauto', 3);
model.mesh('mesh2').feature('ftri1').feature('size2').name('Cladding Mesh');
model.mesh('mesh2').feature('ftri1').feature('size2').set('hauto', 4);
model.mesh('mesh2').feature('ftri1').feature('size3').name('Exterior Mesh');
model.mesh('mesh2').feature('ftri1').feature('size3').set('hauto', 7);
model.mesh('mesh2').run;

model.coordSystem('sys2').name('Boundary System');
model.coordSystem('sys2').set('identifier', 'sys');

model.study.create('std1');
model.study('std1').feature.create('mode', 'ModeAnalysis');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').attach('std1');
model.sol('sol1').feature.create('st1', 'StudyStep');
model.sol('sol1').feature.create('v1', 'Variables');
model.sol('sol1').feature.create('e1', 'Eigenvalue');

model.study('std1').feature('mode').set('initstudyhide', 'on');
model.study('std1').feature('mode').set('initsolhide', 'on');
model.study('std1').feature('mode').set('notstudyhide', 'on');
model.study('std1').feature('mode').set('notsolhide', 'on');

model.sol.create('sol2');
model.sol('sol2').study('std1');
model.sol('sol2').feature.create('su1', 'StoreSolution');
model.sol('sol2').feature.create('su2', 'StoreSolution');
model.sol('sol2').feature.create('su3', 'StoreSolution');
model.sol('sol2').feature.create('su4', 'StoreSolution');
model.sol('sol2').feature.create('su5', 'StoreSolution');
model.sol('sol2').feature.create('su6', 'StoreSolution');
model.sol('sol2').feature.create('su7', 'StoreSolution');
model.sol('sol2').feature.create('su8', 'StoreSolution');
model.sol('sol2').feature.create('su9', 'StoreSolution');
model.sol('sol2').feature.create('su10', 'StoreSolution');
model.sol('sol2').feature.create('su11', 'StoreSolution');

model.study('std1').feature('mode').set('initstudyhide', 'on');
model.study('std1').feature('mode').set('initsolhide', 'on');
model.study('std1').feature('mode').set('notstudyhide', 'on');
model.study('std1').feature('mode').set('notsolhide', 'on');

model.sol('sol3').study('std1');

model.study('std1').feature('mode').set('initstudyhide', 'on');
model.study('std1').feature('mode').set('initsolhide', 'on');
model.study('std1').feature('mode').set('notstudyhide', 'on');
model.study('std1').feature('mode').set('notsolhide', 'on');

model.sol('sol4').study('std1');

model.study('std1').feature('mode').set('initstudyhide', 'on');
model.study('std1').feature('mode').set('initsolhide', 'on');
model.study('std1').feature('mode').set('notstudyhide', 'on');
model.study('std1').feature('mode').set('notsolhide', 'on');

model.sol('sol5').study('std1');

model.study('std1').feature('mode').set('initstudyhide', 'on');
model.study('std1').feature('mode').set('initsolhide', 'on');
model.study('std1').feature('mode').set('notstudyhide', 'on');
model.study('std1').feature('mode').set('notsolhide', 'on');

model.sol('sol6').study('std1');

model.study('std1').feature('mode').set('initstudyhide', 'on');
model.study('std1').feature('mode').set('initsolhide', 'on');
model.study('std1').feature('mode').set('notstudyhide', 'on');
model.study('std1').feature('mode').set('notsolhide', 'on');

model.sol('sol7').study('std1');

model.study('std1').feature('mode').set('initstudyhide', 'on');
model.study('std1').feature('mode').set('initsolhide', 'on');
model.study('std1').feature('mode').set('notstudyhide', 'on');
model.study('std1').feature('mode').set('notsolhide', 'on');

model.sol('sol8').study('std1');

model.study('std1').feature('mode').set('initstudyhide', 'on');
model.study('std1').feature('mode').set('initsolhide', 'on');
model.study('std1').feature('mode').set('notstudyhide', 'on');
model.study('std1').feature('mode').set('notsolhide', 'on');

model.sol('sol9').study('std1');

model.study('std1').feature('mode').set('initstudyhide', 'on');
model.study('std1').feature('mode').set('initsolhide', 'on');
model.study('std1').feature('mode').set('notstudyhide', 'on');
model.study('std1').feature('mode').set('notsolhide', 'on');

model.sol('sol10').study('std1');

model.study('std1').feature('mode').set('initstudyhide', 'on');
model.study('std1').feature('mode').set('initsolhide', 'on');
model.study('std1').feature('mode').set('notstudyhide', 'on');
model.study('std1').feature('mode').set('notsolhide', 'on');

model.sol('sol11').study('std1');

model.study('std1').feature('mode').set('initstudyhide', 'on');
model.study('std1').feature('mode').set('initsolhide', 'on');
model.study('std1').feature('mode').set('notstudyhide', 'on');
model.study('std1').feature('mode').set('notsolhide', 'on');

model.sol('sol12').study('std1');

model.study('std1').feature('mode').set('initstudyhide', 'on');
model.study('std1').feature('mode').set('initsolhide', 'on');
model.study('std1').feature('mode').set('notstudyhide', 'on');
model.study('std1').feature('mode').set('notsolhide', 'on');

model.sol('sol13').study('std1');

model.study('std1').feature('mode').set('initstudyhide', 'on');
model.study('std1').feature('mode').set('initsolhide', 'on');
model.study('std1').feature('mode').set('notstudyhide', 'on');
model.study('std1').feature('mode').set('notsolhide', 'on');

model.result.dataset.create('cln1', 'CutLine2D');
model.result.dataset.remove('dset2');
model.result.dataset.remove('dset3');
model.result.dataset.remove('dset4');
model.result.dataset.remove('dset5');
model.result.dataset.remove('dset6');
model.result.dataset.remove('dset7');
model.result.dataset.remove('dset8');
model.result.dataset.remove('dset9');
model.result.dataset.remove('dset10');
model.result.dataset.remove('dset11');
model.result.dataset.remove('dset12');
model.result.dataset.remove('dset13');
model.result.create('pg1', 'PlotGroup2D');
model.result.create('pg3', 'PlotGroup1D');
model.result('pg1').feature.create('surf1', 'Surface');
model.result('pg1').feature.create('con1', 'Contour');
model.result('pg3').feature.create('lngr1', 'LineGraph');
model.result('pg3').feature.create('lngr2', 'LineGraph');
model.result.report.create('rpt1', 'Report');
model.result.report('rpt1').feature.create('tp1', 'TitlePage');
model.result.report('rpt1').feature.create('toc1', 'TableOfContents');
model.result.report('rpt1').feature.create('sec1', 'Section');
model.result.report('rpt1').feature.create('sec2', 'Section');
model.result.report('rpt1').feature.create('sec3', 'Section');
model.result.report('rpt1').feature.create('sec4', 'Section');
model.result.report('rpt1').feature('sec1').feature.create('sec1', 'Section');
model.result.report('rpt1').feature('sec1').feature('sec1').feature.create('param1', 'Parameter');
model.result.report('rpt1').feature('sec2').feature.create('sec1', 'Section');
model.result.report('rpt1').feature('sec2').feature.create('sec2', 'Section');
model.result.report('rpt1').feature('sec2').feature.create('sec3', 'Section');
model.result.report('rpt1').feature('sec2').feature.create('sec4', 'Section');
model.result.report('rpt1').feature('sec2').feature.create('sec5', 'Section');
model.result.report('rpt1').feature('sec2').feature('sec1').feature.create('sec1', 'Section');
model.result.report('rpt1').feature('sec2').feature('sec1').feature.create('sec2', 'Section');
model.result.report('rpt1').feature('sec2').feature('sec1').feature('sec1').feature.create('sec1', 'Section');
model.result.report('rpt1').feature('sec2').feature('sec1').feature('sec1').feature.create('sec2', 'Section');
model.result.report('rpt1').feature('sec2').feature('sec1').feature('sec1').feature.create('sec3', 'Section');
model.result.report('rpt1').feature('sec2').feature('sec1').feature('sec2').feature.create('sec1', 'Section');
model.result.report('rpt1').feature('sec2').feature('sec1').feature('sec2').feature('sec1').feature.create('csys1', 'CoordinateSystem');
model.result.report('rpt1').feature('sec2').feature('sec2').feature.create('geom1', 'Geometry');
model.result.report('rpt1').feature('sec2').feature('sec3').feature.create('sec1', 'Section');
model.result.report('rpt1').feature('sec2').feature('sec3').feature.create('sec2', 'Section');
model.result.report('rpt1').feature('sec2').feature('sec3').feature.create('sec3', 'Section');
model.result.report('rpt1').feature('sec2').feature('sec3').feature('sec1').feature.create('mat1', 'Material');
model.result.report('rpt1').feature('sec2').feature('sec3').feature('sec2').feature.create('mat1', 'Material');
model.result.report('rpt1').feature('sec2').feature('sec3').feature('sec3').feature.create('mat1', 'Material');
model.result.report('rpt1').feature('sec2').feature('sec4').feature.create('phys1', 'Physics');
model.result.report('rpt1').feature('sec2').feature('sec5').feature.create('mesh1', 'Mesh');
model.result.report('rpt1').feature('sec3').feature.create('std1', 'Study');
model.result.report('rpt1').feature('sec4').feature.create('sec1', 'Section');
model.result.report('rpt1').feature('sec4').feature.create('sec2', 'Section');
model.result.report('rpt1').feature('sec4').feature('sec1').feature.create('sec1', 'Section');
model.result.report('rpt1').feature('sec4').feature('sec1').feature.create('sec2', 'Section');
model.result.report('rpt1').feature('sec4').feature('sec1').feature('sec1').feature.create('dset1', 'DataSet');
model.result.report('rpt1').feature('sec4').feature('sec1').feature('sec2').feature.create('dset1', 'DataSet');
model.result.report('rpt1').feature('sec4').feature('sec2').feature.create('sec1', 'Section');
model.result.report('rpt1').feature('sec4').feature('sec2').feature.create('sec4', 'Section');
model.result.report('rpt1').feature('sec4').feature('sec2').feature('sec1').feature.create('pg1', 'PlotGroup');
model.result.report('rpt1').feature('sec4').feature('sec2').feature('sec4').feature.create('pg1', 'PlotGroup');

model.study('std1').name('SMF-28 in Water (Mode Analysis Study)');
model.study('std1').feature('mode').set('neigs', '100');
model.study('std1').feature('mode').set('modeFreq', 'FREQUENCY');
model.study('std1').feature('mode').set('shift', '(N_CORE+N_CLADDING)/2');

model.sol('sol1').attach('std1');
model.sol('sol1').feature('st1').name('Compile Equations: Mode Analysis');
model.sol('sol1').feature('st1').set('studystep', 'mode');
model.sol('sol1').feature('v1').set('control', 'mode');
model.sol('sol1').feature('e1').set('control', 'mode');
model.sol('sol1').feature('e1').set('shift', '(N_CORE+N_CLADDING)/2');
model.sol('sol1').feature('e1').set('neigs', '100');
model.sol('sol1').feature('e1').set('transform', 'effective_mode_index');
model.sol('sol1').feature('e1').feature('aDef').set('complexfun', true);
model.sol('sol2').name('Parametric 2');

model.result.dataset('dset1').name('Mode Solutions');
model.result.dataset('dset1').set('phase', '45');
model.result.dataset('cln1').name('Radial Cut Line from Mode Solutions');
model.result.dataset('cln1').set('genpoints', {'0' '0'; '100' '100'});
model.result('pg1').name('Electric and Magnetic Fields');
model.result('pg1').set('frametype', 'spatial');
model.result('pg1').feature('surf1').name('Electric Field');
model.result('pg1').feature('surf1').set('descr', 'Electric field, z component');
model.result('pg1').feature('surf1').set('expr', 'ewfd.Ez');
model.result('pg1').feature('surf1').set('colortable', 'WaveLight');
model.result('pg1').feature('con1').name('Magnetic Field');
model.result('pg1').feature('con1').set('colortable', 'Wave');
model.result('pg1').feature('con1').set('expr', 'ewfd.Hz');
model.result('pg1').feature('con1').set('descr', 'Magnetic field, z component');
model.result('pg1').feature('con1').set('unit', 'A/m');
model.result('pg3').name('Electric and Magnetic Fields (Line Plot)');
model.result('pg3').set('data', 'cln1');
model.result('pg3').set('xlabel', 'Arc length');
model.result('pg3').set('xlabelactive', false);
model.result('pg3').feature('lngr1').name('Electric Field Norm');
model.result('pg3').feature('lngr1').set('linecolor', 'red');
model.result('pg3').feature('lngr2').name('Magnetic Field Norm');
model.result('pg3').feature('lngr2').set('linecolor', 'blue');
model.result('pg3').feature('lngr2').set('unit', 'A/m');
model.result('pg3').feature('lngr2').set('expr', 'ewfd.normH');
model.result('pg3').feature('lngr2').set('descr', 'Magnetic field norm');
model.result('pg3').feature('lngr2').set('linestyle', 'dotted');
model.result.report('rpt1').name('Brief Report');
model.result.report('rpt1').set('level', 'brief');
model.result.report('rpt1').feature('tp1').name('Smf-28-Sellmeier-Water-Freq');
model.result.report('rpt1').feature('tp1').set('date', 'Mar 17, 2014 5:16:41 PM');
model.result.report('rpt1').feature('tp1').set('frontmatterlayout', 'headings');
model.result.report('rpt1').feature('sec1').name('Global Definitions');
model.result.report('rpt1').feature('sec1').feature('sec1').name('Parameters 1');
model.result.report('rpt1').feature('sec1').feature('sec1').set('source', 'firstchild');
model.result.report('rpt1').feature('sec2').name('SMF-28 in Water (Sellmeier Dispersion Model) (model)');
model.result.report('rpt1').feature('sec2').feature('sec1').name('Definitions');
model.result.report('rpt1').feature('sec2').feature('sec1').feature('sec1').name('Selections');
model.result.report('rpt1').feature('sec2').feature('sec1').feature('sec1').feature('sec1').set('source', 'firstchild');
model.result.report('rpt1').feature('sec2').feature('sec1').feature('sec1').feature('sec2').set('source', 'firstchild');
model.result.report('rpt1').feature('sec2').feature('sec1').feature('sec1').feature('sec3').set('source', 'firstchild');
model.result.report('rpt1').feature('sec2').feature('sec1').feature('sec2').name('Coordinate Systems');
model.result.report('rpt1').feature('sec2').feature('sec1').feature('sec2').feature('sec1').name('Boundary System');
model.result.report('rpt1').feature('sec2').feature('sec1').feature('sec2').feature('sec1').set('source', 'firstchild');
model.result.report('rpt1').feature('sec2').feature('sec1').feature('sec2').feature('sec1').feature('csys1').set('includesettings', false);
model.result.report('rpt1').feature('sec2').feature('sec2').name('SMF-28 (Water) Geometry');
model.result.report('rpt1').feature('sec2').feature('sec2').set('source', 'firstchild');
model.result.report('rpt1').feature('sec2').feature('sec2').feature('geom1').set('children', {'c1' 'off'; 'c2' 'off'; 'c3' 'off'; 'fin' 'off'});
model.result.report('rpt1').feature('sec2').feature('sec2').feature('geom1').set('includestats', false);
model.result.report('rpt1').feature('sec2').feature('sec3').name('Materials');
model.result.report('rpt1').feature('sec2').feature('sec3').feature('sec1').name('Core (Doped Silica Glass)');
model.result.report('rpt1').feature('sec2').feature('sec3').feature('sec1').set('source', 'firstchild');
model.result.report('rpt1').feature('sec2').feature('sec3').feature('sec1').feature('mat1').set('includesettings', false);
model.result.report('rpt1').feature('sec2').feature('sec3').feature('sec1').feature('mat1').set('children', {'def' 'off' 'off'; 'RefractiveIndex' 'off' 'off'});
model.result.report('rpt1').feature('sec2').feature('sec3').feature('sec2').name('Cladding (Silica Glass)');
model.result.report('rpt1').feature('sec2').feature('sec3').feature('sec2').set('source', 'firstchild');
model.result.report('rpt1').feature('sec2').feature('sec3').feature('sec2').feature('mat1').set('noderef', 'mat5');
model.result.report('rpt1').feature('sec2').feature('sec3').feature('sec2').feature('mat1').set('includesettings', false);
model.result.report('rpt1').feature('sec2').feature('sec3').feature('sec2').feature('mat1').set('children', {'def' 'off' 'off'; 'RefractiveIndex' 'off' 'off'});
model.result.report('rpt1').feature('sec2').feature('sec3').feature('sec3').name('Exterior (Water)');
model.result.report('rpt1').feature('sec2').feature('sec3').feature('sec3').set('source', 'firstchild');
model.result.report('rpt1').feature('sec2').feature('sec3').feature('sec3').feature('mat1').set('noderef', 'mat6');
model.result.report('rpt1').feature('sec2').feature('sec3').feature('sec3').feature('mat1').set('includesettings', false);
model.result.report('rpt1').feature('sec2').feature('sec3').feature('sec3').feature('mat1').set('children', {'def' 'off' 'off'; 'RefractiveIndex' 'off' 'off'});
model.result.report('rpt1').feature('sec2').feature('sec4').name('Electromagnetic Waves, Frequency Domain (ewfd)');
model.result.report('rpt1').feature('sec2').feature('sec4').feature('phys1').set('includeselection', false);
model.result.report('rpt1').feature('sec2').feature('sec4').feature('phys1').set('includeequations', false);
model.result.report('rpt1').feature('sec2').feature('sec4').feature('phys1').set('includefeaturetable', true);
model.result.report('rpt1').feature('sec2').feature('sec4').feature('phys1').set('children', {'wee1' 'off' 'off'; 'pec1' 'off' 'off'; 'init1' 'off' 'off'; 'wee2' 'off' 'off'; 'wee3' 'off' 'off'; 'wee4' 'off' 'off'});
model.result.report('rpt1').feature('sec2').feature('sec4').feature('phys1').set('includesettings', false);
model.result.report('rpt1').feature('sec2').feature('sec4').feature('phys1').set('includevariables', false);
model.result.report('rpt1').feature('sec2').feature('sec5').name('Mesh');
model.result.report('rpt1').feature('sec2').feature('sec5').set('source', 'firstchild');
model.result.report('rpt1').feature('sec2').feature('sec5').feature('mesh1').set('children', {'size' 'off'; 'ftri1' 'off'});
model.result.report('rpt1').feature('sec3').name('SMF-28 in Water (Mode Analysis Study)');
model.result.report('rpt1').feature('sec4').name('Results');
model.result.report('rpt1').feature('sec4').feature('sec1').name('Data Sets');
model.result.report('rpt1').feature('sec4').feature('sec1').feature('sec1').name('Mode Solutions');
model.result.report('rpt1').feature('sec4').feature('sec1').feature('sec1').set('source', 'firstchild');
model.result.report('rpt1').feature('sec4').feature('sec1').feature('sec2').name('Radial Cut Line from Mode Solutions');
model.result.report('rpt1').feature('sec4').feature('sec1').feature('sec2').set('source', 'firstchild');
model.result.report('rpt1').feature('sec4').feature('sec1').feature('sec2').feature('dset1').set('noderef', 'cln1');
model.result.report('rpt1').feature('sec4').feature('sec2').name('Plot Groups');
model.result.report('rpt1').feature('sec4').feature('sec2').feature('sec1').name('Electric and Magnetic Fields');
model.result.report('rpt1').feature('sec4').feature('sec2').feature('sec1').set('source', 'firstchild');
model.result.report('rpt1').feature('sec4').feature('sec2').feature('sec4').name('Electric and Magnetic Fields (Line Plot)');
model.result.report('rpt1').feature('sec4').feature('sec2').feature('sec4').set('source', 'firstchild');
model.result.report('rpt1').feature('sec4').feature('sec2').feature('sec4').feature('pg1').set('noderef', 'pg3');

model.mesh.clearMeshes;

model.sol('sol1').clearSolution;
model.sol('sol2').clearSolution;
model.sol('sol3').clearSolution;
model.sol('sol4').clearSolution;
model.sol('sol5').clearSolution;
model.sol('sol6').clearSolution;
model.sol('sol7').clearSolution;
model.sol('sol8').clearSolution;
model.sol('sol9').clearSolution;
model.sol('sol10').clearSolution;
model.sol('sol11').clearSolution;
model.sol('sol12').clearSolution;
model.sol('sol13').clearSolution;

model.result('pg1').run;

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('e1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').feature.create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'mode');
model.sol('sol1').feature.create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'mode');
model.sol('sol1').feature.create('e1', 'Eigenvalue');
model.sol('sol1').feature('e1').set('shift', '(N_CORE+N_CLADDING)/2');
model.sol('sol1').feature('e1').set('neigs', 100);
model.sol('sol1').feature('e1').set('transform', 'effective_mode_index');
model.sol('sol1').feature('e1').set('control', 'mode');
model.sol('sol1').feature('e1').feature('aDef').set('complexfun', true);
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').set('looplevel', {'100'});
model.result('pg1').run;
model.result('pg1').set('looplevel', {'99'});
model.result('pg1').run;
model.result('pg1').run;
model.result('pg3').run;
model.result('pg3').setIndex('looplevelinput', 'first', 0);
model.result('pg3').run;
model.result('pg3').setIndex('looplevelinput', 'last', 0);
model.result('pg3').run;
model.result('pg3').setIndex('looplevelinput', 'manual', 0);
model.result('pg3').setIndex('looplevel', '2', 0);
model.result('pg3').run;
model.result('pg3').setIndex('looplevel', '3', 0);
model.result('pg3').run;
model.result('pg3').setIndex('looplevel', '4', 0);
model.result('pg3').setIndex('looplevel', '40', 0);
model.result('pg3').run;
model.result('pg3').setIndex('looplevel', '41', 0);
model.result('pg3').setIndex('looplevel', '61', 0);
model.result('pg3').setIndex('looplevel', '100', 0);
model.result('pg3').setIndex('looplevel', '99', 0);
model.result('pg3').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg3').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg1').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').feature('lngr1').set('expr', 'ewfd.neff');
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').setIndex('looplevel', '98', 0);
model.result('pg3').run;
model.result('pg3').setIndex('looplevel', '101', 0);
model.result('pg3').run;
model.result('pg3').setIndex('looplevel', '102', 0);
model.result('pg3').run;
model.result('pg3').setIndex('looplevel', '100', 0);
model.result('pg3').run;
model.result('pg3').setIndex('looplevel', '99', 0);
model.result('pg3').run;
model.result('pg3').setIndex('looplevel', '98', 0);
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').feature('lngr1').set('xdataexpr', 'ewfd.neff');
model.result('pg3').feature('lngr1').set('xdatadescr', 'Effective mode index');
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').feature('lngr1').set('xdataexpr', 'ewfd.k');
model.result('pg3').feature('lngr1').set('xdatadescr', 'Wave number');
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').setIndex('looplevel', '99', 0);
model.result('pg3').run;
model.result('pg3').setIndex('looplevel', '98', 0);
model.result('pg3').setIndex('looplevel', '87', 0);
model.result('pg3').run;
model.result('pg3').setIndex('looplevel', '86', 0);
model.result('pg3').setIndex('looplevel', '58', 0);
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').feature('lngr1').set('xdataexpr', 'ewfd.omega');
model.result('pg3').feature('lngr1').set('xdatadescr', 'Angular frequency');
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').feature.remove('lngr2');
model.result('pg3').run;
model.result('pg3').setIndex('looplevelinput', 'all', 0);
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').feature('lngr1').set('xdataexpr', 'ewfd.freq');
model.result('pg3').feature('lngr1').set('xdatadescr', 'Frequency');
model.result('pg3').run;
model.result('pg3').feature('lngr1').set('xdataexpr', '1/ewfd.freq');
model.result('pg3').run;
model.result('pg3').feature('lngr1').set('xdataexpr', 'c_const/ewfd.freq');
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').set('data', 'dset1');
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').feature('lngr1').set('xdataexpr', 'ewfd.freq');
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').set('data', 'cln1');
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').set('data', 'dset1');
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;

model.name('smf28_sellmeier_water_old.mph');

model.result('pg3').run;
model.result('pg1').run;

out = model;
