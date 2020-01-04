function model = fibergen( file_name, name, edf_model, core_radius, cladding_radius, exterior_radius, n_core, n_cladding, n_exterior  )
% SMF28GEN Generates a comsol smf-28 model
import com.comsol.model.*
import com.comsol.model.util.*

% Create model
model = create_model( name );

% Set global parameters
set_parameters( model, core_radius, cladding_radius, exterior_radius, n_core, n_cladding, n_exterior );

% Create model node
MODEL_NODE_TAG = 'mod2';
MODEL_NODE_IDENTIFIER = 'model';
create_model_node( model, MODEL_NODE_TAG, name, MODEL_NODE_IDENTIFIER );

switch edf_model
    case 'sellmeier'
        ;
    otherwise
        ;
end

% Create model geometry
GEOMETRY_TAG = 'geom2';
create_geometry( model, GEOMETRY_TAG, 2, 'SMF-28 (Water) Geometry' );

% Create selection
selection = model.selection.create('sel1', 'Explicit');
selection.set([1 2 3]);
selection = model.selection.create('sel2', 'Explicit');
selection.set([1 2 3]);
selection = model.selection.create('sel3', 'Explicit');
selection.set([1 2 3]);

% Create view
model.view('view1').tag('view2');
model.view.create('view3', 3);

% Create materials
MATERIAL_IDENTIFIER_1 = 'mat4';
MATERIAL_IDENTIFIER_2 = 'mat5';
MATERIAL_IDENTIFIER_3 = 'mat6';

REFRACTIVE_INDEX_PROPERTY = 'RefractiveIndex';
REFRACTIVE_INDEX = 'Refractive index';

material = model.material.create(MATERIAL_IDENTIFIER_1);
material.propertyGroup.create(REFRACTIVE_INDEX_PROPERTY, REFRACTIVE_INDEX);
material.selection.set([3]);
material = model.material.create(MATERIAL_IDENTIFIER_2);
material.propertyGroup.create(REFRACTIVE_INDEX_PROPERTY, REFRACTIVE_INDEX);
material.selection.set([2]);
material = model.material.create(MATERIAL_IDENTIFIER_3);
material.propertyGroup.create(REFRACTIVE_INDEX_PROPERTY, REFRACTIVE_INDEX);
material.selection.set([1]);

% Create physics
PHYSICS_IDENTIFIER = 'ewfd2';
ELECTRIC_FIELD = 'electricfield';

physics = model.physics.create(PHYSICS_IDENTIFIER, 'ElectromagneticWavesFrequencyDomain', GEOMETRY_TAG);
physics.field(ELECTRIC_FIELD).field('E2');
physics.field(ELECTRIC_FIELD).component({'E2x' 'E2y' 'E2z'});

% Sellmeier core physics
WAVE_EQUATION_ELECTRIC_IDENTIFIER_1 = 'wee2';
feature = physics.feature.create(WAVE_EQUATION_ELECTRIC_IDENTIFIER_1, 'WaveEquationElectric', 2);
feature.selection.set([3]);

% Sellmeier exterior physics
WAVE_EQUATION_ELECTRIC_IDENTIFIER_2 = 'wee3';
feature = physics.feature.create(WAVE_EQUATION_ELECTRIC_IDENTIFIER_2, 'WaveEquationElectric', 2);
feature.selection.set([1]);

% Sellmeier cladding physics
WAVE_EQUATION_ELECTRIC_IDENTIFIER_3 = 'wee4';
feature = physics.feature.create(WAVE_EQUATION_ELECTRIC_IDENTIFIER_3, 'WaveEquationElectric', 2);
feature.selection.set([2]);

% Create mesh
MESH_IDENTIFIER = 'mesh2';
mesh = model.mesh.create(MESH_IDENTIFIER, GEOMETRY_TAG);
feature = mesh.feature.create('ftri1', 'FreeTri');
feat1 = feature.feature.create('size1', 'Size');
feat1.selection.geom(GEOMETRY_TAG, 2);
feat1.selection.set([3]);
feat2 = feature.feature.create('size2', 'Size');
feat2.selection.geom(GEOMETRY_TAG, 2);
feat2.selection.set([2]);
feat3 = feature.feature.create('size3', 'Size');
feat3.selection.geom(GEOMETRY_TAG, 2);
feat3.selection.set([1]);

% ?
model.frame('material1').tag('material2');
% ?
model.coordSystem('sys1').tag('sys2');

% Set view parameters
model.view('view2').name('View');
model.view('view2').axis.set('xmin', '-137.51580810546875');
model.view('view2').axis.set('ymin', '-90.75');
model.view('view2').axis.set('xmax', '137.51580810546875');
model.view('view2').axis.set('ymax', '90.75');

% Set material parameters
MATERIAL_IDENTIFIER_1 = 'mat4';
material = model.material(MATERIAL_IDENTIFIER_1);
material.name('Core (Doped Silica Glass)');
material.propertyGroup(REFRACTIVE_INDEX_PROPERTY).set('n', {'N_CORE' '0' '0' '0' 'N_CORE' '0' '0' '0' 'N_CORE'});
material.propertyGroup(REFRACTIVE_INDEX_PROPERTY).set('ki', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
material = model.material(MATERIAL_IDENTIFIER_2);
material.name('Cladding (Silica Glass)');
material.propertyGroup(REFRACTIVE_INDEX_PROPERTY).set('n', {'N_CLADDING' '0' '0' '0' 'N_CLADDING' '0' '0' '0' 'N_CLADDING'});
material.propertyGroup(REFRACTIVE_INDEX_PROPERTY).set('ki', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
material = model.material(MATERIAL_IDENTIFIER_3);
material.name('Exterior (Water)');
material.propertyGroup(REFRACTIVE_INDEX_PROPERTY).set('n', {'N_EXTERIOR' '0' '0' '0' 'N_EXTERIOR' '0' '0' '0' 'N_EXTERIOR'});
material.propertyGroup(REFRACTIVE_INDEX_PROPERTY).set('ki', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});

% Set physics parameters
physics = model.physics(PHYSICS_IDENTIFIER);
physics.name('Electromagnetic Waves, Frequency Domain');

% Wave equation, electric
feature = physics.feature('wee1');
feature.name('Wave Equation, Electric');
feature.set('coeffB', {'0.7028554'; '0.4146307'; '0.897454'});
feature.set('coeffC', {'0.0727723 [um]'; '0.1143085 [um]'; '9.896161 [um]'});
feature.set('materialType', 'from_mat');

% Sellmeier dispersion core
feature = physics.feature(WAVE_EQUATION_ELECTRIC_IDENTIFIER_1);
feature.name('Sellmeier Core');
feature.set('DisplacementFieldModel', 'SellmeierDispersionModel');
feature.set('coeffB', {'0.7028554'; '0.4146307'; '0.897454'});
feature.set('coeffC', {'(0.0727723 [um])^2'; '(0.1143085 [um])^2'; '(9.896161 [um])^2'});
feature.set('materialType', 'from_mat');

% Sellmeier dispersion exterior
feature = physics.feature(WAVE_EQUATION_ELECTRIC_IDENTIFIER_2);
feature.name('Sellmeier Exterior');
feature.set('DisplacementFieldModel', 'SellmeierDispersionModel');
feature.set('coeffB', {'0.5689094'; '0.1719709'; '0.02062502'});
feature.set('coeffC', {'(0.005110302 [um])^2'; '(0.05110302 [um])^2'; '(0.02624159 [um])^2'});

% Sellmeier dispersion cladding
feature = physics.feature(WAVE_EQUATION_ELECTRIC_IDENTIFIER_3);
feature.name('Sellmeier Cladding');
feature.set('DisplacementFieldModel', 'SellmeierDispersionModel');
feature.set('coeffB', {'0.6961663'; '0.4079426'; '0.8974790'});
feature.set('coeffC', {'(0.06840430 [um])^2'; '(0.1162414 [um])^2'; '(9.896161 [um])^2'});

% Set mesh parameters
mesh = model.mesh(MESH_IDENTIFIER);
mesh.name('Mesh');
mesh.feature('size').set('custom', 'on');
feature = mesh.feature('ftri1');
feat1 = feature.feature('size1');
feat1.name('Core Mesh');
feat1.set('hauto', 3);
feat2 = feature.feature('size2');
feat2.name('Cladding Mesh');
feat2.set('hauto', 4);
feat3 = feature.feature('size3');
feat3.name('Exterior Mesh');
feat3.set('hauto', 7);
mesh.run;

% Set coordinate system parameters
sys = model.coordSystem('sys2');
sys.name('Boundary System');
sys.set('identifier', 'sys');

% Create study
study = model.study.create('std1');
study.feature.create('mode', 'ModeAnalysis');

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

model.save(file_name);
end

function model = create_model(name)
% Creates a model and set model name
import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create( 'Model' );
model.name(name);
end

function set_parameters(model, core_radius, cladding_radius, exterior_radius, n_core, n_cladding, n_exterior)
% Set model parameters
import com.comsol.model.*
import com.comsol.model.util.*

param = model.param;
param.name('Global Model Parameters');
param.set('CORE_RADIUS', core_radius);
param.set('CLADDING_RADIUS', cladding_radius);
param.set('EXTERIOR_RADIUS', exterior_radius);
param.set('N_CORE', n_core);
param.set('N_CLADDING', n_cladding);
param.set('N_EXTERIOR', n_exterior);
param.set('FREE_SPACE_WAVELENGTH', '1.55 [um]');
param.set('FREQUENCY', 'c_const/FREE_SPACE_WAVELENGTH');
end

function create_model_node(model, tag, name, identifier)
% Creates the model node
import com.comsol.model.*
import com.comsol.model.util.*

model_node = model.modelNode.create(tag);
model_node.name(name);
model_node.identifier(identifier);
end

function create_geometry(model, tag, dimensions, name)
% Creates the geometry
import com.comsol.model.*
import com.comsol.model.util.*

geom = model.geom.create(tag, dimensions);
geom.name(name);

geom.lengthUnit([native2unicode(hex2dec('00b5'), 'Cp1252') 'm']);
geom.scaleUnitValue(true);

feature = geom.feature.create('c1', 'Circle');
feature.name('Core');
feature.set('r', 'CORE_RADIUS');
feature.set('pos', {'0' '0'});

feature = geom.feature.create('c2', 'Circle');
feature.name('Cladding');
feature.set('r', 'CLADDING_RADIUS');
feature.set('pos', {'0' '0'});

feature = geom.feature.create('c3', 'Circle');
feature.name('Exterior');
feature.set('r', 'EXTERIOR_RADIUS');

geom.run;
end