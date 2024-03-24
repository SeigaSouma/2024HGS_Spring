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
 98;
 -390.87115;1349.28967;266.09897;,
 303.41986;1349.28967;266.09897;,
 303.41986;1349.28967;-177.26134;,
 -390.87115;1349.28967;-177.26134;,
 -390.87115;-0.73110;-177.26134;,
 303.41986;-0.73110;-177.26134;,
 303.41986;-0.73110;266.09897;,
 -390.87115;-0.73110;266.09897;,
 -390.87115;166.06946;-177.26134;,
 303.41986;166.06946;-177.26134;,
 -390.87115;166.06946;-177.26134;,
 303.41986;166.06946;-177.26134;,
 303.41986;-0.73110;-177.26134;,
 -390.87115;-0.73110;-177.26134;,
 -390.87115;166.06946;-177.26134;,
 -390.87115;166.06944;266.09897;,
 303.41986;166.06946;-177.26134;,
 303.41986;166.06944;266.09897;,
 297.17487;1096.96277;-176.21483;,
 399.91046;1096.96277;-176.21483;,
 399.91046;328.86609;-176.21483;,
 297.17487;328.86609;-176.21483;,
 399.91046;1096.96277;-176.21483;,
 399.91046;1096.96277;-120.93814;,
 399.91046;328.86609;-120.93814;,
 399.91046;328.86609;-176.21483;,
 399.91046;1096.96277;-120.93814;,
 297.17487;1096.96277;-120.93814;,
 297.17487;328.86609;-120.93814;,
 399.91046;328.86609;-120.93814;,
 297.17487;1096.96277;-120.93814;,
 297.17487;1096.96277;-176.21483;,
 297.17487;328.86609;-176.21483;,
 297.17487;328.86609;-120.93814;,
 399.91046;1096.96277;-176.21483;,
 297.17487;1096.96277;-176.21483;,
 297.17487;328.86609;-176.21483;,
 399.91046;328.86609;-176.21483;,
 -381.90997;197.54019;-232.67151;,
 293.47131;197.54019;-232.67151;,
 293.47131;151.38626;-232.67151;,
 -381.90997;151.38626;-232.67151;,
 293.47131;197.54019;-232.67151;,
 293.47131;197.54019;-110.55939;,
 293.47131;151.38626;-110.55939;,
 293.47131;151.38626;-232.67151;,
 293.47131;197.54019;-110.55939;,
 -381.90997;197.54019;-110.55939;,
 -381.90997;151.38626;-110.55939;,
 293.47131;151.38626;-110.55939;,
 -381.90997;197.54019;-110.55939;,
 -381.90997;197.54019;-232.67151;,
 -381.90997;151.38626;-232.67151;,
 -381.90997;151.38626;-110.55939;,
 293.47131;197.54019;-232.67151;,
 -381.90997;197.54019;-232.67151;,
 -381.90997;151.38626;-232.67151;,
 293.47131;151.38626;-232.67151;,
 -380.78534;157.31061;-197.11435;,
 -347.46277;157.31061;-197.11435;,
 -347.46277;-2.16147;-197.11435;,
 -380.78534;-2.16147;-197.11435;,
 -347.46277;157.31061;-197.11435;,
 -347.46277;157.31061;-177.30447;,
 -347.46277;-2.16147;-177.30447;,
 -347.46277;-2.16147;-197.11435;,
 -347.46277;157.31061;-177.30447;,
 -380.78534;157.31061;-177.30447;,
 -380.78534;-2.16147;-177.30447;,
 -347.46277;-2.16147;-177.30447;,
 -380.78534;157.31061;-177.30447;,
 -380.78534;157.31061;-197.11435;,
 -380.78534;-2.16147;-197.11435;,
 -380.78534;-2.16147;-177.30447;,
 -347.46277;157.31061;-197.11435;,
 -380.78534;157.31061;-197.11435;,
 -380.78534;-2.16147;-197.11435;,
 -347.46277;-2.16147;-197.11435;,
 257.52289;157.31061;-197.11435;,
 290.84546;157.31061;-197.11435;,
 290.84546;-2.16147;-197.11435;,
 257.52289;-2.16147;-197.11435;,
 290.84546;157.31061;-197.11435;,
 290.84546;157.31061;-177.30447;,
 290.84546;-2.16147;-177.30447;,
 290.84546;-2.16147;-197.11435;,
 290.84546;157.31061;-177.30447;,
 257.52289;157.31061;-177.30447;,
 257.52289;-2.16147;-177.30447;,
 290.84546;-2.16147;-177.30447;,
 257.52289;157.31061;-177.30447;,
 257.52289;157.31061;-197.11435;,
 257.52289;-2.16147;-197.11435;,
 257.52289;-2.16147;-177.30447;,
 290.84546;157.31061;-197.11435;,
 257.52289;157.31061;-197.11435;,
 257.52289;-2.16147;-197.11435;,
 290.84546;-2.16147;-197.11435;;
 
 34;
 4;0,1,2,3;,
 4;4,5,6,7;,
 4;8,3,2,9;,
 4;10,11,12,13;,
 4;14,4,7,15;,
 4;14,15,0,3;,
 4;16,2,1,17;,
 4;16,17,6,5;,
 4;15,7,6,17;,
 4;15,17,1,0;,
 4;18,19,20,21;,
 4;22,23,24,25;,
 4;26,27,28,29;,
 4;30,31,32,33;,
 4;30,23,34,35;,
 4;36,37,24,33;,
 4;38,39,40,41;,
 4;42,43,44,45;,
 4;46,47,48,49;,
 4;50,51,52,53;,
 4;50,43,54,55;,
 4;56,57,44,53;,
 4;58,59,60,61;,
 4;62,63,64,65;,
 4;66,67,68,69;,
 4;70,71,72,73;,
 4;70,63,74,75;,
 4;76,77,64,73;,
 4;78,79,80,81;,
 4;82,83,84,85;,
 4;86,87,88,89;,
 4;90,91,92,93;,
 4;90,83,94,95;,
 4;96,97,84,93;;
 
 MeshMaterialList {
  4;
  34;
  0,
  0,
  1,
  3,
  1,
  1,
  1,
  1,
  1,
  1,
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
   0.677647;0.677647;0.677647;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
   TextureFilename {
    "data\\TEXTURE\\bill01\\window.png";
   }
  }
  Material {
   0.000000;0.000000;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
   TextureFilename {
    "data\\TEXTURE\\bill01\\22937751.png";
   }
  }
 }
 MeshNormals {
  30;
  0.000000;1.000000;0.000000;,
  0.000000;-1.000000;-0.000000;,
  0.000000;0.000000;-1.000000;,
  -1.000000;0.000000;0.000000;,
  1.000000;0.000000;0.000000;,
  0.000000;0.000000;1.000000;,
  0.000000;0.000000;-1.000000;,
  1.000000;0.000000;0.000000;,
  0.000000;0.000000;1.000000;,
  -1.000000;0.000000;0.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;-1.000000;-0.000000;,
  0.000000;0.000000;-1.000000;,
  1.000000;0.000000;0.000000;,
  0.000000;0.000000;1.000000;,
  -1.000000;0.000000;0.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;-1.000000;-0.000000;,
  0.000000;0.000000;-1.000000;,
  1.000000;0.000000;0.000000;,
  0.000000;0.000000;1.000000;,
  -1.000000;0.000000;0.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;-1.000000;-0.000000;,
  0.000000;0.000000;-1.000000;,
  1.000000;0.000000;0.000000;,
  0.000000;0.000000;1.000000;,
  -1.000000;0.000000;0.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;-1.000000;-0.000000;;
  34;
  4;0,0,0,0;,
  4;1,1,1,1;,
  4;2,2,2,2;,
  4;2,2,2,2;,
  4;3,3,3,3;,
  4;3,3,3,3;,
  4;4,4,4,4;,
  4;4,4,4,4;,
  4;5,5,5,5;,
  4;5,5,5,5;,
  4;6,6,6,6;,
  4;7,7,7,7;,
  4;8,8,8,8;,
  4;9,9,9,9;,
  4;10,10,10,10;,
  4;11,11,11,11;,
  4;12,12,12,12;,
  4;13,13,13,13;,
  4;14,14,14,14;,
  4;15,15,15,15;,
  4;16,16,16,16;,
  4;17,17,17,17;,
  4;18,18,18,18;,
  4;19,19,19,19;,
  4;20,20,20,20;,
  4;21,21,21,21;,
  4;22,22,22,22;,
  4;23,23,23,23;,
  4;24,24,24,24;,
  4;25,25,25,25;,
  4;26,26,26,26;,
  4;27,27,27,27;,
  4;28,28,28,28;,
  4;29,29,29,29;;
 }
 MeshTextureCoords {
  98;
  -3.072250;-13.614070;,
  4.082430;-13.614070;,
  4.082430;-13.614070;,
  -3.072250;-13.614070;,
  -3.072250;0.507650;,
  4.082430;0.507650;,
  4.082430;0.507650;,
  -3.072250;0.507650;,
  -3.072250;-1.237146;,
  4.082430;-1.237146;,
  -0.999850;0.087259;,
  2.004122;0.087259;,
  2.004122;1.055871;,
  -0.999850;1.055871;,
  -3.072250;-1.237146;,
  -3.072250;-1.237146;,
  4.082430;-1.237146;,
  4.082430;-1.237146;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;;
 }
}
