require 'csv'

OPTIMODE_DATA_OUTPUT = ARGV[0]
COMSOL_DATA_OUTPUT = ARGV[1]

text = File.open(OPTIMODE_DATA_OUTPUT).read

# Fix newlines
text.gsub!(/\r\n?/, "\n")

om_modes = []
om_n_effs = []

i = 0
text.each_line do |line|
  tmp = line.split(' ')
  om_modes[i] = tmp[0]
  om_n_effs[i] = tmp[1]
  i += 1
end

# puts om_n_effs.sort


text = CSV.read(COMSOL_DATA_OUTPUT)

comsol_modes = []
comsol_n_effs = []

i = 0
text[9].each do |val|
  if i < 2
  	i += 1
  	next
  end
  comsol_n_effs << val
  i += 1
end

# puts comsol_n_effs.sort

puts (comsol_n_effs | om_n_effs).sort