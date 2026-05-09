import fs from 'fs';
import turf from '@turf/turf';

const data = JSON.parse(fs.readFileSync('./public/data/bengaluru-wards.geojson', 'utf8'));

console.time('union');
const unionPolygon = turf.union(data);
console.timeEnd('union');

if (unionPolygon) {
  const mask = turf.mask(unionPolygon);
  console.log('Mask generated successfully.');
}
