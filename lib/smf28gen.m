function model = smf28gen( file_name )
% SMF28GEN Generates a comsol smf-28 model
import com.comsol.model.*
import com.comsol.model.util.*

% Parameters
NAME = 'smf-28';
ELECTRIC_DISPLACEMENT_FIELD_MODEL = 'sellmeier';
CORE_RADIUS = '4.1 [um]';
CLADDING_RADIUS = '62.5 [um]';
EXTERIOR_RADIUS = 'CLADDING_RADIUS + 20 [um]';

N_CORE = '1.448701601';
N_CLADDING = '1.444023625';
N_WATER = '1.327292175';

model = fibergen( file_name, NAME, ELECTRIC_DISPLACEMENT_FIELD_MODEL, CORE_RADIUS, CLADDING_RADIUS, EXTERIOR_RADIUS, N_CORE, N_CLADDING, N_WATER );
end