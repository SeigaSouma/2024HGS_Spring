xof 0302txt 0064
template Header {
 <3D82AB43-62DA-11cf-AB39-0020AF71E433>
 WORD major;
 WORD minor;
 DWORD flags;
}

template Vector {
 <3D82AB5E-62DA-11cf-AB39-0020AF71E433>
 FLOAT x;
 FLOAT y;
 FLOAT z;
}

template Coords2d {
 <F6F23F44-7686-11cf-8F52-0040333594A3>
 FLOAT u;
 FLOAT v;
}

template Matrix4x4 {
 <F6F23F45-7686-11cf-8F52-0040333594A3>
 array FLOAT matrix[16];
}

template ColorRGBA {
 <35FF44E0-6C7C-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
}

template ColorRGB {
 <D3E16E81-7835-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
}

template IndexedColor {
 <1630B820-7842-11cf-8F52-0040333594A3>
 DWORD index;
 ColorRGBA indexColor;
}

template Boolean {
 <4885AE61-78E8-11cf-8F52-0040333594A3>
 WORD truefalse;
}

template Boolean2d {
 <4885AE63-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template MaterialWrap {
 <4885AE60-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template TextureFilename {
 <A42790E1-7810-11cf-8F52-0040333594A3>
 STRING filename;
}

template Material {
 <3D82AB4D-62DA-11cf-AB39-0020AF71E433>
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
}

template MeshFace {
 <3D82AB5F-62DA-11cf-AB39-0020AF71E433>
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
}

template MeshFaceWraps {
 <4885AE62-78E8-11cf-8F52-0040333594A3>
 DWORD nFaceWrapValues;
 Boolean2d faceWrapValues;
}

template MeshTextureCoords {
 <F6F23F40-7686-11cf-8F52-0040333594A3>
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
}

template MeshMaterialList {
 <F6F23F42-7686-11cf-8F52-0040333594A3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material]
}

template MeshNormals {
 <F6F23F43-7686-11cf-8F52-0040333594A3>
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
}

template MeshVertexColors {
 <1630B821-7842-11cf-8F52-0040333594A3>
 DWORD nVertexColors;
 array IndexedColor vertexColors[nVertexColors];
}

template Mesh {
 <3D82AB44-62DA-11cf-AB39-0020AF71E433>
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
}

Header{
1;
0;
1;
}

Mesh {
 49;
 -69.84237;0.00002;0.00000;,
 -69.84237;0.00002;-69.84235;,
 -75.89966;-53.34902;-75.89966;,
 -75.89966;-53.34902;0.00000;,
 69.84236;0.00002;0.00000;,
 69.84236;0.00002;-69.84235;,
 -0.00001;0.00002;-69.84235;,
 -0.00001;0.00002;0.00000;,
 75.89965;-53.34902;-0.00000;,
 75.89965;-53.34902;-75.89966;,
 -0.00001;-252.87168;-65.87326;,
 65.87325;-252.87168;-65.87326;,
 65.87325;-252.87168;-0.00000;,
 -0.00001;-252.87168;0.00000;,
 -0.00001;0.00002;-69.84235;,
 69.84236;0.00002;-69.84235;,
 75.89965;-53.34902;-75.89966;,
 -0.00001;-53.34902;-75.89966;,
 75.89965;-53.34902;75.89964;,
 69.84236;0.00002;69.84235;,
 -0.00001;0.00002;69.84235;,
 -0.00001;-53.34902;75.89964;,
 -72.91871;-219.05469;-72.91872;,
 -72.91871;-219.05469;0.00000;,
 72.91869;-219.05469;-72.91872;,
 -0.00001;-219.05469;-72.91872;,
 72.91869;-219.05469;-0.00000;,
 72.91869;-219.05469;-72.91872;,
 72.91869;-219.05469;72.91870;,
 -0.00001;-219.05469;72.91870;,
 -65.87325;-252.87168;-65.87326;,
 -65.87325;-252.87168;0.00000;,
 65.87325;-252.87168;-65.87326;,
 -0.00001;-252.87168;-65.87326;,
 65.87325;-252.87168;65.87326;,
 -0.00001;-252.87168;65.87326;,
 65.87325;-252.87168;65.87326;,
 -0.00001;-252.87168;65.87326;,
 72.91869;-219.05469;72.91870;,
 75.89965;-53.34902;75.89964;,
 69.84236;0.00002;69.84235;,
 -0.00001;0.00002;69.84235;,
 -75.89966;-53.34902;75.89964;,
 -69.84237;0.00002;69.84235;,
 -72.91871;-219.05469;72.91870;,
 -65.87325;-252.87168;65.87326;,
 -65.87325;-252.87168;0.00000;,
 -65.87325;-252.87168;-65.87326;,
 -65.87325;-252.87168;65.87326;;
 
 32;
 4;0,1,2,3;,
 4;4,5,6,7;,
 4;8,9,5,4;,
 4;10,11,12,13;,
 4;14,15,16,17;,
 4;18,19,20,21;,
 4;3,2,22,23;,
 4;17,16,24,25;,
 4;26,27,9,8;,
 4;28,18,21,29;,
 4;23,22,30,31;,
 4;25,24,32,33;,
 4;12,11,27,26;,
 4;34,28,29,35;,
 4;36,37,13,12;,
 4;38,36,12,26;,
 4;39,38,26,8;,
 4;40,39,8,4;,
 4;41,40,4,7;,
 4;42,43,0,3;,
 4;44,42,3,23;,
 4;45,44,23,31;,
 4;43,41,7,0;,
 4;6,1,0,7;,
 4;2,1,14,17;,
 4;22,2,17,25;,
 4;30,22,25,33;,
 4;46,47,10,13;,
 4;37,48,46,13;,
 4;29,44,45,35;,
 4;21,42,44,29;,
 4;20,43,42,21;;
 
 MeshMaterialList {
  1;
  32;
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0;;
  Material {
   0.400000;0.400000;0.400000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
 }
 MeshNormals {
  36;
  -0.978979;-0.203961;0.000000;,
  -0.993616;0.112816;0.000000;,
  0.000000;0.112816;0.993616;,
  0.000000;1.000000;0.000000;,
  0.000000;-0.203961;0.978979;,
  0.000000;-1.000000;-0.000000;,
  -0.998870;0.047517;0.000000;,
  0.998870;0.047517;0.000000;,
  0.000000;0.047517;0.998870;,
  -0.993769;-0.111463;0.000000;,
  -0.993769;-0.111463;0.000000;,
  0.000000;-0.111463;-0.993769;,
  0.000000;-0.111463;0.993769;,
  0.993769;-0.111463;-0.000000;,
  0.998870;0.047517;0.000000;,
  -0.998870;0.047517;0.000000;,
  -0.993769;-0.111463;0.000000;,
  0.000000;0.112816;0.993616;,
  0.000000;0.047517;-0.998870;,
  0.000000;-0.203961;0.978979;,
  0.000000;-0.111463;0.993769;,
  0.000000;0.047517;0.998870;,
  0.993616;0.112816;0.000000;,
  0.000000;0.112816;-0.993616;,
  0.000000;0.112816;-0.993616;,
  0.000000;0.047517;-0.998870;,
  0.993769;-0.111463;-0.000000;,
  0.000000;-0.203961;-0.978979;,
  0.978979;-0.203961;-0.000000;,
  0.993769;-0.111463;-0.000000;,
  0.978979;-0.203961;-0.000000;,
  0.000000;0.047517;-0.998870;,
  0.000000;-0.111463;0.993769;,
  0.000000;-0.203961;0.978979;,
  0.000000;0.047517;0.998870;,
  0.000000;0.112816;0.993616;;
  32;
  4;1,1,6,15;,
  4;3,3,3,3;,
  4;14,7,22,22;,
  4;5,5,5,5;,
  4;23,24,25,18;,
  4;8,2,17,21;,
  4;15,6,10,16;,
  4;18,25,11,11;,
  4;13,26,7,14;,
  4;12,8,21,20;,
  4;16,10,0,0;,
  4;11,11,27,27;,
  4;28,28,26,13;,
  4;4,12,20,19;,
  4;5,5,5,5;,
  4;29,30,28,13;,
  4;7,29,13,14;,
  4;22,7,14,22;,
  4;3,3,3,3;,
  4;6,1,1,15;,
  4;9,6,15,16;,
  4;0,9,16,0;,
  4;3,3,3,3;,
  4;3,3,3,3;,
  4;31,23,23,18;,
  4;11,31,18,11;,
  4;27,11,11,27;,
  4;5,5,5,5;,
  4;5,5,5,5;,
  4;20,32,33,19;,
  4;21,34,32,20;,
  4;17,35,34,21;;
 }
 MeshTextureCoords {
  49;
  0.500000;0.750000;,
  0.625000;0.750000;,
  0.625000;0.875000;,
  0.500000;0.875000;,
  0.500000;0.500000;,
  0.625000;0.500000;,
  0.625000;0.625000;,
  0.500000;0.625000;,
  0.500000;0.375000;,
  0.625000;0.375000;,
  0.625000;0.125000;,
  0.625000;0.250000;,
  0.500000;0.250000;,
  0.500000;0.125000;,
  0.750000;0.750000;,
  0.875000;0.750000;,
  0.875000;0.875000;,
  0.750000;0.875000;,
  0.125000;0.875000;,
  0.125000;0.750000;,
  0.250000;0.750000;,
  0.250000;0.875000;,
  0.625000;0.937500;,
  0.500000;0.937500;,
  0.875000;0.937500;,
  0.750000;0.937500;,
  0.500000;0.312500;,
  0.625000;0.312500;,
  0.125000;0.937500;,
  0.250000;0.937500;,
  0.625000;1.000000;,
  0.500000;1.000000;,
  0.875000;1.000000;,
  0.750000;1.000000;,
  0.125000;1.000000;,
  0.250000;1.000000;,
  0.375000;0.250000;,
  0.375000;0.125000;,
  0.375000;0.312500;,
  0.375000;0.375000;,
  0.375000;0.500000;,
  0.375000;0.625000;,
  0.375000;0.875000;,
  0.375000;0.750000;,
  0.375000;0.937500;,
  0.375000;1.000000;,
  0.500000;0.000000;,
  0.625000;0.000000;,
  0.375000;0.000000;;
 }
}
