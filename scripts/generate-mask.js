import fs from 'fs';
import * as turf from '@turf/turf';

const data = JSON.parse(fs.readFileSync('./public/data/bengaluru-wards.geojson', 'utf8'));

console.time('union');
let unionPolygon = turf.union(data);
console.timeEnd('union');

if (unionPolygon) {
  // turf.mask takes a polygon and creates an inverted polygon over the world
  const mask = turf.mask(unionPolygon);
  fs.writeFileSync('./public/data/gba-mask.geojson', JSON.stringify(mask));
  console.log('Mask generated successfully and saved to public/data/gba-mask.geojson.');
} else {
  console.error('Failed to generate union polygon.');
}
