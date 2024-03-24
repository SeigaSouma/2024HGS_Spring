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
 152;
 62.89812;17.24808;-102.01608;,
 57.36464;23.80464;-106.06924;,
 101.44836;33.66624;-106.06924;,
 98.20428;31.48636;-99.56996;,
 212.42769;287.04393;-0.41584;,
 159.28804;201.86281;-75.40872;,
 152.88612;202.95608;-0.41584;,
 64.79384;22.71956;95.00868;,
 67.83044;13.80768;85.89360;,
 100.28856;28.72192;85.89360;,
 102.66288;39.14048;95.00868;,
 215.46433;271.08934;-0.41584;,
 161.33957;182.20169;74.57708;,
 161.83212;184.05504;-0.41584;,
 158.30292;198.15661;74.57708;,
 65.02768;76.31088;-75.72580;,
 66.59972;79.61076;71.71692;,
 66.99700;86.52328;-75.40872;,
 66.50468;94.88264;-0.41584;,
 66.01212;85.45320;74.57708;,
 63.84016;74.67056;-89.05884;,
 107.71736;92.35460;-89.05884;,
 162.32469;185.90880;-75.40872;,
 105.13976;99.89028;-96.55664;,
 63.88772;78.44820;-96.55664;,
 65.95148;85.75424;85.84804;,
 109.65272;105.41153;88.70808;,
 109.85396;89.50592;83.74004;,
 65.29524;76.70580;83.61248;,
 12.14484;0.96940;-127.33897;,
 5.22156;9.17220;-132.41008;,
 60.37696;21.51048;-132.41008;,
 56.31820;18.78280;-124.27848;,
 154.31532;275.52049;-0.22188;,
 119.18228;207.68433;-94.04916;,
 115.17744;208.36809;-47.13552;,
 111.17265;209.05196;-0.22188;,
 14.51652;7.81448;119.16845;,
 18.31604;-3.33528;107.76413;,
 58.92580;15.32424;107.76413;,
 61.89628;28.35984;119.16845;,
 158.11464;255.55923;-0.22188;,
 121.74912;183.08581;93.60544;,
 122.36541;185.40468;-0.22188;,
 117.94968;203.04705;93.60544;,
 14.80940;74.86556;-94.44592;,
 16.77604;78.99368;90.02700;,
 17.27340;87.64328;-94.04916;,
 16.96516;92.87248;-47.13552;,
 16.65688;98.10164;-0.22188;,
 16.34888;92.20292;46.69180;,
 16.04096;86.30416;93.60544;,
 13.32352;72.81280;-111.12752;,
 68.22036;94.93944;-111.12752;,
 122.98156;187.72324;-94.04916;,
 64.99544;104.36600;-120.50840;,
 13.38288;77.53952;-120.50840;,
 15.96512;86.68044;107.70712;,
 70.64192;111.27488;111.28549;,
 70.89372;91.37436;105.06968;,
 15.14388;75.35920;104.91004;,
 17.27340;87.64328;-94.04916;,
 16.96516;92.87248;-47.13552;,
 115.17744;208.36809;-47.13552;,
 119.18228;207.68433;-94.04916;,
 114.56116;206.04949;46.69180;,
 177.74552;65.86808;-77.93872;,
 230.43809;62.14324;-61.51488;,
 230.43809;14.16640;-61.51488;,
 180.47576;10.37920;-100.66888;,
 -15.77476;0.00000;0.00000;,
 -15.61676;41.94352;-1.37588;,
 -15.61676;41.94352;-52.40576;,
 -15.77476;0.00000;-52.40576;,
 125.66148;-57.60008;94.10696;,
 176.25032;-46.11372;75.51056;,
 176.26984;8.70408;88.23424;,
 125.66165;3.81728;89.91644;,
 235.47637;-39.76212;50.81392;,
 235.47637;-39.76212;-56.73764;,
 235.47637;14.16640;50.81392;,
 235.47637;68.09496;50.81392;,
 235.47637;68.09496;-56.73764;,
 230.43809;72.88604;-50.80260;,
 125.66148;73.69064;-74.52496;,
 125.66148;73.69064;68.60120;,
 230.43809;72.88604;44.87888;,
 230.43809;-44.55276;44.87888;,
 125.66148;-68.34260;68.60120;,
 125.66148;-68.34260;-74.52496;,
 230.43809;-44.55276;-50.80260;,
 230.43809;-33.81028;-61.51488;,
 176.58876;69.97316;-74.53808;,
 117.70112;71.85136;-92.33852;,
 125.66148;69.54972;-94.17280;,
 125.66148;6.61820;-115.11989;,
 117.70112;5.72984;-113.01400;,
 177.99517;-45.71764;-85.84392;,
 176.58876;-53.13280;-82.51276;,
 117.70112;-66.50316;92.27264;,
 117.70112;2.67412;87.93492;,
 117.70112;71.85136;83.59720;,
 125.66148;69.54972;85.43148;,
 176.29456;65.97060;71.01120;,
 176.58876;69.97316;67.20556;,
 230.43809;13.93492;55.59116;,
 230.43809;-33.81028;55.59116;,
 176.58876;-53.13280;71.54328;,
 117.70112;-66.50316;-108.28788;,
 85.70772;68.79164;-92.33852;,
 85.58648;2.67244;-109.69004;,
 53.71428;65.73228;-92.33852;,
 53.71428;65.73228;83.59720;,
 53.21600;-66.50316;92.27264;,
 53.21600;-66.50316;-108.28788;,
 85.45860;-66.50316;-108.28788;,
 53.21600;-66.50316;-132.99152;,
 15.52576;-66.23656;-132.99152;,
 16.02396;65.99884;-112.71408;,
 53.71428;65.73228;-112.71408;,
 16.02396;65.99884;77.47920;,
 16.02396;65.99884;-2.96188;,
 16.02396;65.99884;-83.40296;,
 53.71428;65.73228;106.79041;,
 16.02396;65.99884;106.79041;,
 15.52576;-66.23656;108.01372;,
 53.21600;-66.50316;108.01372;,
 15.52576;-66.23656;-83.40296;,
 15.52576;-66.23656;1.37588;,
 15.52576;-66.23656;86.15472;,
 53.46528;-0.38544;-100.31320;,
 15.77484;-0.11888;-83.40296;,
 15.77484;-0.11888;81.81696;,
 125.66148;-57.60008;-110.12216;,
 230.43809;62.14324;55.59116;,
 -15.77476;0.00000;52.40572;,
 -15.61676;41.94352;49.65400;,
 -15.93276;-41.94352;1.37588;,
 -15.93276;-41.94352;55.15748;,
 -15.93276;-41.94352;-52.40576;,
 0.00000;-0.05936;-67.90436;,
 0.20356;53.97108;-67.90436;,
 0.20356;53.97108;-2.16888;,
 0.20356;53.97108;63.56660;,
 0.00000;-0.05936;67.11136;,
 -0.20356;-54.09012;70.65608;,
 -0.20356;-54.09012;1.37588;,
 -0.20356;-54.09012;-67.90436;,
 16.34888;92.20292;46.69180;,
 16.04096;86.30416;93.60544;,
 117.94968;203.04705;93.60544;,
 114.56116;206.04949;46.69180;;
 
 169;
 4;0,1,2,3;,
 3;4,5,6;,
 4;7,8,9,10;,
 3;11,12,13;,
 4;4,14,12,11;,
 3;15,16,17;,
 3;17,16,18;,
 3;18,16,19;,
 4;15,20,21,22;,
 4;22,21,23,5;,
 4;5,23,24,17;,
 4;17,24,20,15;,
 4;19,25,26,14;,
 4;14,26,27,12;,
 4;12,27,28,16;,
 4;16,28,25,19;,
 4;20,0,3,21;,
 4;21,3,2,23;,
 4;23,2,1,24;,
 4;24,1,0,20;,
 4;25,7,10,26;,
 4;26,10,9,27;,
 4;27,9,8,28;,
 4;28,8,7,25;,
 4;22,5,4,11;,
 4;17,18,6,5;,
 3;16,15,12;,
 3;15,13,12;,
 3;13,15,22;,
 3;14,4,6;,
 3;22,11,13;,
 4;18,19,14,6;,
 4;29,30,31,32;,
 4;33,34,35,36;,
 4;37,38,39,40;,
 3;41,42,43;,
 4;33,44,42,41;,
 3;45,46,47;,
 3;47,46,48;,
 3;48,46,49;,
 3;49,46,50;,
 3;50,46,51;,
 4;45,52,53,54;,
 4;54,53,55,34;,
 4;34,55,56,47;,
 4;47,56,52,45;,
 4;51,57,58,44;,
 4;44,58,59,42;,
 4;42,59,60,46;,
 4;46,60,57,51;,
 4;52,29,32,53;,
 4;53,32,31,55;,
 4;55,31,30,56;,
 4;56,30,29,52;,
 4;57,37,40,58;,
 4;58,40,39,59;,
 4;59,39,38,60;,
 4;60,38,37,57;,
 4;54,34,33,41;,
 4;61,62,63,64;,
 3;46,45,42;,
 3;42,45,43;,
 3;43,45,54;,
 4;44,33,36,65;,
 3;54,41,43;,
 4;49,50,65,36;,
 4;66,67,68,69;,
 4;70,71,72,73;,
 4;74,75,76,77;,
 3;78,79,80;,
 3;80,79,81;,
 3;81,79,82;,
 4;83,84,85,86;,
 4;87,88,89,90;,
 3;79,91,82;,
 3;82,68,67;,
 3;68,82,91;,
 4;82,67,66,92;,
 4;93,94,95,96;,
 4;97,91,79,98;,
 4;99,74,77,100;,
 4;101,102,103,104;,
 4;105,106,78,80;,
 4;75,74,99,107;,
 4;82,83,86,81;,
 3;101,104,85;,
 3;85,104,86;,
 3;86,104,81;,
 4;101,85,84,93;,
 3;93,84,92;,
 3;84,83,92;,
 3;92,83,82;,
 4;78,87,90,79;,
 3;108,98,89;,
 3;89,98,90;,
 3;90,98,79;,
 4;108,89,88,99;,
 3;99,88,107;,
 3;88,87,107;,
 3;107,87,78;,
 4;109,93,96,110;,
 3;111,112,109;,
 3;112,101,109;,
 3;109,101,93;,
 3;112,113,101;,
 3;113,100,101;,
 3;100,113,99;,
 3;114,115,113;,
 3;113,115,99;,
 3;99,115,108;,
 4;116,117,118,119;,
 3;120,112,121;,
 3;121,112,122;,
 3;122,112,111;,
 4;123,124,125,126;,
 3;127,114,128;,
 3;128,114,129;,
 3;129,114,113;,
 3;111,130,119;,
 3;130,114,119;,
 3;119,114,116;,
 4;111,119,118,122;,
 3;117,127,118;,
 3;118,131,122;,
 3;131,118,127;,
 4;127,117,116,114;,
 4;112,123,126,113;,
 4;113,126,125,129;,
 3;120,132,124;,
 3;132,129,124;,
 3;124,129,125;,
 4;120,124,123,112;,
 4;108,115,110,96;,
 4;95,133,108,96;,
 4;91,97,69,68;,
 4;66,94,93,92;,
 4;95,94,66,69;,
 4;97,133,95,69;,
 4;108,133,97,98;,
 4;130,111,109,110;,
 4;115,114,130,110;,
 4;77,102,101,100;,
 4;103,102,77,76;,
 4;81,134,105,80;,
 4;103,134,81,104;,
 4;105,134,103,76;,
 4;75,106,105,76;,
 4;78,106,75,107;,
 4;135,136,71,70;,
 4;137,138,135,70;,
 4;139,137,70,73;,
 4;140,73,72,141;,
 4;141,72,71,142;,
 4;142,71,136,143;,
 4;143,136,135,144;,
 4;144,135,138,145;,
 4;145,138,137,146;,
 4;147,139,73,140;,
 4;146,137,139,147;,
 4;48,49,36,35;,
 4;148,149,150,151;,
 4;131,140,141,122;,
 4;122,141,142,121;,
 4;121,142,143,120;,
 4;120,143,144,132;,
 4;132,144,145,129;,
 4;129,145,146,128;,
 4;128,146,147,127;,
 4;127,147,140,131;;
 
 MeshMaterialList {
  1;
  169;
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
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
   TextureFilename {
    "union_arm_UV_Green.jpg";
   }
  }
 }
 MeshNormals {
  189;
  -0.982155;0.183966;0.039082;,
  0.716634;-0.674164;0.178713;,
  -0.926981;0.358154;-0.111494;,
  -0.727546;0.646799;-0.228753;,
  -0.980709;0.195468;0.001345;,
  0.575586;0.017598;0.817552;,
  -0.999548;0.022582;-0.019858;,
  0.819026;-0.434568;0.374629;,
  0.264596;-0.506381;0.820712;,
  0.875379;-0.152970;-0.458597;,
  -0.944548;0.328143;-0.012271;,
  -0.322159;0.481933;0.814833;,
  0.401294;-0.102615;0.910183;,
  0.192093;-0.399104;-0.896558;,
  0.239228;-0.744123;-0.623739;,
  0.113794;-0.294795;0.948761;,
  0.290246;-0.650441;0.701914;,
  -0.816087;0.577861;0.008852;,
  0.906227;-0.341392;0.249407;,
  -0.798011;0.602602;0.006961;,
  0.802583;-0.596465;-0.009471;,
  -0.952559;0.304336;-0.003159;,
  -0.982156;0.183962;0.039086;,
  0.724733;-0.666672;0.174100;,
  -0.924121;0.366125;-0.109327;,
  -0.728247;0.647120;-0.225592;,
  -0.978554;0.205982;0.001933;,
  0.694150;0.037781;0.718839;,
  -0.999848;-0.004337;-0.016886;,
  0.851209;-0.418784;0.316327;,
  0.265350;-0.515120;0.815010;,
  0.885278;-0.144125;-0.442165;,
  -0.943195;0.332148;-0.007769;,
  -0.323302;0.489501;0.809855;,
  0.814607;-0.121041;0.567243;,
  0.192295;-0.405064;-0.893838;,
  0.239223;-0.744118;-0.623748;,
  0.113792;-0.294792;0.948762;,
  0.290244;-0.650437;0.701918;,
  -0.838774;0.544422;0.007884;,
  0.986965;-0.160930;0.001354;,
  -0.801279;0.598253;0.006686;,
  0.815168;-0.579156;-0.008959;,
  -0.947979;0.318320;-0.002965;,
  0.884631;-0.332147;-0.327271;,
  0.718448;0.361937;-0.593998;,
  0.137946;-0.960264;-0.242620;,
  -0.022881;0.483706;-0.874932;,
  0.044280;-0.124631;0.991215;,
  -0.028235;0.987302;0.156328;,
  0.744412;-0.474166;0.470125;,
  0.877111;0.312128;0.365039;,
  0.602716;-0.126347;-0.787890;,
  0.489653;0.255840;-0.833538;,
  0.097027;0.507633;-0.856093;,
  0.212909;-0.257406;-0.942556;,
  0.114540;-0.175862;0.977728;,
  0.048105;0.373561;0.926357;,
  0.464556;0.243910;0.851291;,
  0.522582;-0.172577;0.834940;,
  0.254267;0.940709;0.224532;,
  0.254707;0.943254;-0.213067;,
  -0.016148;0.992645;0.119982;,
  -0.019130;0.994383;-0.104097;,
  0.392223;-0.904824;0.165696;,
  0.395462;-0.907000;-0.144779;,
  0.133219;-0.988243;-0.075022;,
  0.137613;-0.985103;0.103124;,
  -0.005659;-0.999984;0.000000;,
  -0.027047;0.999634;0.000000;,
  -0.027048;0.999634;-0.000000;,
  -0.002088;0.063551;0.997976;,
  -0.218603;-0.975814;0.000000;,
  -0.152058;0.988372;0.000000;,
  -0.206828;0.978377;0.000000;,
  -0.164529;-0.986372;0.000000;,
  0.001072;0.151568;-0.988446;,
  0.000065;0.009250;0.999957;,
  0.999993;-0.003767;-0.000007;,
  -0.134944;0.117991;-0.983803;,
  0.054968;0.108268;-0.992601;,
  0.598321;0.012289;-0.801163;,
  0.169507;0.861952;-0.477814;,
  0.310351;0.484689;-0.817777;,
  0.411153;0.057922;-0.909724;,
  0.454689;-0.291848;-0.841477;,
  0.386574;-0.784636;-0.484671;,
  -0.117311;0.231654;-0.965699;,
  -0.106814;0.118727;-0.987165;,
  0.000000;-1.000000;-0.000000;,
  -0.125336;0.063428;0.990085;,
  -0.037104;0.056220;0.997729;,
  0.562209;0.005732;0.826975;,
  0.918711;0.000000;0.394931;,
  0.162599;0.854912;0.492634;,
  0.262801;0.436216;0.860611;,
  0.301827;0.029160;0.952917;,
  0.365281;-0.270623;0.890693;,
  0.355998;-0.775394;0.521564;,
  -0.315975;0.948767;0.000000;,
  -0.326238;-0.945288;0.000000;,
  -0.916709;0.029595;0.398458;,
  -0.922173;0.003474;-0.386762;,
  -0.999993;0.003767;0.000000;,
  -0.922174;0.003474;-0.386760;,
  -0.906555;0.315469;-0.280425;,
  -0.895045;0.445976;0.000000;,
  -0.916710;0.029594;0.398456;,
  -0.897850;0.333958;0.286944;,
  -0.898382;-0.439216;0.000000;,
  -0.910956;-0.292990;0.290372;,
  -0.908907;-0.308627;-0.280424;,
  -0.786576;0.612677;-0.076972;,
  -0.942032;0.332815;-0.042541;,
  -0.782867;0.615703;0.089607;,
  -0.951862;0.304246;0.037323;,
  -0.700827;0.002640;-0.713327;,
  -0.700827;0.002640;-0.713327;,
  -0.605217;0.796061;0.000000;,
  -0.680912;0.050499;0.730622;,
  -0.680912;0.050498;0.730622;,
  -0.611198;-0.791478;0.000000;,
  -0.700827;0.002640;-0.713326;,
  0.719136;0.136872;0.681255;,
  0.692244;-0.709369;0.132647;,
  0.644141;-0.007674;-0.764868;,
  -0.320036;0.464548;-0.825695;,
  -0.966101;0.080605;0.245258;,
  -0.488387;0.736259;0.468402;,
  -0.712476;0.665379;0.222821;,
  0.335891;-0.692464;-0.638491;,
  0.578502;-0.740940;-0.341092;,
  -0.997776;0.005469;-0.066437;,
  0.047111;-0.200686;0.978522;,
  0.993104;-0.114006;0.027339;,
  -0.057616;0.160968;-0.985277;,
  -0.912370;-0.020576;0.408848;,
  0.987705;-0.118107;0.102423;,
  0.014998;-0.036565;-0.999219;,
  -0.997566;-0.005411;-0.069521;,
  0.727112;0.138394;-0.672424;,
  0.982326;0.186972;0.008759;,
  0.668402;-0.732754;0.127710;,
  0.754999;0.013738;-0.655583;,
  -0.319498;0.471757;-0.821807;,
  -0.966099;0.080600;0.245269;,
  -0.487925;0.745997;0.453230;,
  -0.712784;0.666613;0.218096;,
  0.335299;-0.701327;-0.629059;,
  0.558893;-0.759095;-0.333787;,
  -0.997776;0.005477;-0.066434;,
  0.047110;-0.200685;0.978522;,
  0.993104;-0.114002;0.027335;,
  -0.057615;0.160968;-0.985277;,
  -0.912365;-0.020579;0.408861;,
  0.987703;-0.118108;0.102439;,
  0.014999;-0.036565;-0.999219;,
  -0.997566;-0.005409;-0.069517;,
  0.172882;0.832953;0.525644;,
  -0.083531;0.995480;-0.045185;,
  0.012299;-0.999034;0.042179;,
  -0.095196;0.995459;-0.000000;,
  -0.006263;0.065487;0.997834;,
  -0.078760;0.064253;0.994821;,
  -0.003537;-0.999994;0.000000;,
  0.999993;-0.003766;-0.000000;,
  0.999993;-0.003768;-0.000004;,
  0.999993;-0.003768;-0.000007;,
  0.999993;-0.003768;-0.000000;,
  0.007072;0.999975;0.000000;,
  -0.999993;0.003767;0.000000;,
  -0.966840;0.003642;-0.255358;,
  -0.999993;0.003767;-0.000000;,
  -0.922173;0.003475;-0.386762;,
  -0.007073;-0.999975;0.000000;,
  0.999993;-0.003768;-0.000000;,
  -0.007073;-0.999975;0.000000;,
  -0.916709;0.029595;0.398458;,
  -0.999993;0.003768;0.000000;,
  -0.964602;0.020881;0.262883;,
  -0.999993;0.003767;0.000000;,
  -0.125234;-0.056476;-0.990519;,
  -0.094890;0.004180;-0.995479;,
  -0.149927;0.119227;-0.981482;,
  -0.158146;0.186856;-0.969574;,
  -0.140991;0.051026;-0.988695;,
  -0.680911;0.050499;0.730623;,
  -0.611198;-0.791478;0.000000;,
  -0.611198;-0.791478;0.000000;;
  169;
  4;14,14,14,14;,
  3;17,3,19;,
  4;15,16,16,15;,
  3;18,7,20;,
  4;123,5,7,18;,
  3;0,6,2;,
  3;2,6,21;,
  3;21,6,4;,
  4;124,8,8,1;,
  4;125,9,9,125;,
  4;3,126,10,2;,
  4;2,10,127,0;,
  4;128,11,11,129;,
  4;5,12,12,7;,
  4;130,13,13,131;,
  4;6,132,132,4;,
  4;8,133,133,8;,
  4;9,134,134,9;,
  4;126,135,135,135;,
  4;10,136,136,127;,
  4;11,15,15,11;,
  4;137,137,137,137;,
  4;13,138,138,13;,
  4;132,139,139,132;,
  4;125,125,140,140;,
  4;2,21,19,3;,
  3;131,124,7;,
  3;124,20,7;,
  3;20,124,1;,
  3;129,17,19;,
  3;1,18,20;,
  4;21,4,129,19;,
  4;36,36,36,36;,
  4;39,25,112,41;,
  4;37,38,38,37;,
  3;40,29,42;,
  4;141,27,29,40;,
  3;22,28,24;,
  3;24,28,113;,
  3;113,28,43;,
  3;43,28,115;,
  3;115,28,26;,
  4;142,30,30,23;,
  4;143,31,31,143;,
  4;25,144,32,24;,
  4;24,32,145,22;,
  4;146,33,33,147;,
  4;27,34,34,29;,
  4;148,35,35,149;,
  4;28,150,150,26;,
  4;30,151,151,30;,
  4;31,152,152,31;,
  4;144,153,153,153;,
  4;32,154,154,145;,
  4;33,37,37,33;,
  4;34,155,155,34;,
  4;35,156,156,35;,
  4;150,157,157,150;,
  4;143,143,141,40;,
  4;24,113,112,25;,
  3;149,142,29;,
  3;29,142,42;,
  3;42,142,23;,
  4;147,39,41,114;,
  3;23,40,42;,
  4;43,115,114,41;,
  4;83,53,81,84;,
  4;103,106,105,104;,
  4;56,97,96,91;,
  3;50,44,93;,
  3;93,44,51;,
  3;51,44,45;,
  4;61,63,62,60;,
  4;64,67,66,65;,
  3;44,52,45;,
  3;45,81,53;,
  3;81,45,52;,
  4;45,53,83,82;,
  4;47,54,80,79;,
  4;85,52,44,86;,
  4;48,56,91,90;,
  4;49,57,95,94;,
  4;92,59,50,93;,
  4;97,56,48,98;,
  4;45,61,60,51;,
  3;49,94,62;,
  3;62,94,60;,
  3;60,94,158;,
  4;49,62,63,159;,
  3;159,63,82;,
  3;63,61,82;,
  3;82,61,45;,
  4;50,64,65,44;,
  3;46,86,66;,
  3;66,86,65;,
  3;65,86,44;,
  4;46,66,67,160;,
  3;160,67,98;,
  3;67,64,98;,
  3;98,64,50;,
  4;87,47,79,88;,
  3;69,70,161;,
  3;70,49,161;,
  3;161,49,159;,
  3;162,71,163;,
  3;71,90,163;,
  3;90,71,48;,
  3;68,89,164;,
  3;164,89,160;,
  3;160,89,46;,
  4;76,76,76,76;,
  3;74,70,99;,
  3;99,70,73;,
  3;73,70,69;,
  4;77,77,77,77;,
  3;72,68,100;,
  3;100,68,75;,
  3;75,68,164;,
  3;165,78,166;,
  3;78,167,166;,
  3;166,167,168;,
  4;69,169,169,73;,
  3;170,171,172;,
  3;172,102,173;,
  3;102,172,171;,
  4;72,174,174,68;,
  4;175,175,175,175;,
  4;164,176,176,75;,
  3;177,101,178;,
  3;101,179,178;,
  3;178,179,180;,
  4;74,169,169,70;,
  4;181,182,88,79;,
  4;80,55,181,79;,
  4;52,85,84,81;,
  4;83,54,47,82;,
  4;80,54,83,84;,
  4;85,55,80,84;,
  4;46,55,85,86;,
  4;183,184,87,88;,
  4;182,185,183,88;,
  4;91,57,163,90;,
  4;95,57,91,96;,
  4;51,58,92,93;,
  4;95,58,51,94;,
  4;92,58,95,96;,
  4;97,59,92,96;,
  4;50,59,97,98;,
  4;107,108,106,103;,
  4;109,110,107,103;,
  4;111,109,103,104;,
  4;116,104,105,117;,
  4;118,105,106,118;,
  4;118,106,108,118;,
  4;186,108,107,119;,
  4;119,107,110,120;,
  4;187,110,109,121;,
  4;122,111,104,116;,
  4;121,109,111,188;,
  4;113,43,41,112;,
  4;115,26,147,114;,
  4;102,116,117,173;,
  4;73,118,118,99;,
  4;99,118,118,74;,
  4;177,186,119,101;,
  4;101,119,120,179;,
  4;75,187,121,100;,
  4;100,121,188,72;,
  4;171,122,116,102;;
 }
 MeshTextureCoords {
  152;
  0.605890;0.303380;,
  0.596130;0.296690;,
  0.673870;0.286630;,
  0.668140;0.288850;,
  0.869560;0.028100;,
  0.775860;0.115010;,
  0.764570;0.113900;,
  0.609230;0.297800;,
  0.614580;0.306890;,
  0.671820;0.291670;,
  0.676010;0.281040;,
  0.874920;0.044380;,
  0.779480;0.135070;,
  0.780350;0.133180;,
  0.774120;0.118790;,
  0.609640;0.243120;,
  0.612410;0.239750;,
  0.613110;0.232700;,
  0.612250;0.224170;,
  0.611380;0.233790;,
  0.607550;0.244790;,
  0.684920;0.226750;,
  0.781210;0.131290;,
  0.680370;0.219060;,
  0.607630;0.240940;,
  0.611270;0.233480;,
  0.688330;0.213420;,
  0.688690;0.229650;,
  0.610110;0.242720;,
  0.617110;0.300920;,
  0.604860;0.292960;,
  0.702460;0.280980;,
  0.695280;0.283630;,
  0.868710;0.034520;,
  0.806530;0.100340;,
  0.799440;0.099680;,
  0.792360;0.099010;,
  0.621300;0.294270;,
  0.628030;0.305090;,
  0.699900;0.286990;,
  0.705150;0.274340;,
  0.875430;0.053890;,
  0.811070;0.124210;,
  0.812160;0.121960;,
  0.804350;0.104840;,
  0.621820;0.229210;,
  0.625300;0.225210;,
  0.626180;0.216820;,
  0.625640;0.211740;,
  0.625090;0.206670;,
  0.624550;0.212390;,
  0.624000;0.218110;,
  0.619190;0.231210;,
  0.716340;0.209740;,
  0.813250;0.119710;,
  0.710640;0.200590;,
  0.619300;0.226620;,
  0.623870;0.217750;,
  0.720630;0.193890;,
  0.721070;0.213200;,
  0.622420;0.228740;,
  0.599900;0.958320;,
  0.599120;0.947100;,
  0.848540;0.699250;,
  0.858710;0.700720;,
  0.798350;0.101930;,
  0.315040;0.047920;,
  0.375730;0.055510;,
  0.375730;0.153310;,
  0.318190;0.161030;,
  0.092190;0.182180;,
  0.092370;0.096680;,
  0.092370;0.096680;,
  0.092190;0.182180;,
  0.255070;0.299590;,
  0.313320;0.276180;,
  0.313350;0.164440;,
  0.255070;0.174400;,
  0.381530;0.263230;,
  0.381530;0.263230;,
  0.381530;0.153310;,
  0.381530;0.043380;,
  0.381530;0.043380;,
  0.375730;0.033610;,
  0.255070;0.031970;,
  0.255070;0.031970;,
  0.375730;0.033610;,
  0.375730;0.273000;,
  0.255070;0.321490;,
  0.255070;0.321490;,
  0.375730;0.273000;,
  0.375730;0.251100;,
  0.313710;0.039550;,
  0.245900;0.035720;,
  0.255070;0.040410;,
  0.255070;0.168690;,
  0.245900;0.170500;,
  0.315330;0.275370;,
  0.313710;0.290490;,
  0.245900;0.317740;,
  0.245900;0.176730;,
  0.245900;0.035720;,
  0.255070;0.040410;,
  0.313370;0.047710;,
  0.313710;0.039550;,
  0.375730;0.153780;,
  0.375730;0.251100;,
  0.313710;0.290490;,
  0.245900;0.317740;,
  0.209060;0.041960;,
  0.208920;0.176730;,
  0.172210;0.048190;,
  0.172210;0.048190;,
  0.171640;0.317740;,
  0.171640;0.317740;,
  0.208770;0.317740;,
  0.171640;0.317740;,
  0.128230;0.317200;,
  0.128810;0.047650;,
  0.172210;0.048190;,
  0.128810;0.047650;,
  0.128810;0.047650;,
  0.128810;0.047650;,
  0.172210;0.048190;,
  0.128810;0.047650;,
  0.128230;0.317200;,
  0.171640;0.317740;,
  0.128230;0.317200;,
  0.128230;0.317200;,
  0.128230;0.317200;,
  0.171920;0.182970;,
  0.128520;0.182430;,
  0.128520;0.182430;,
  0.255070;0.299590;,
  0.375730;0.055510;,
  0.092190;0.182180;,
  0.092370;0.096680;,
  0.092010;0.267680;,
  0.092010;0.267680;,
  0.092010;0.267680;,
  0.110350;0.182300;,
  0.110590;0.072170;,
  0.110590;0.072170;,
  0.110590;0.072170;,
  0.110350;0.182300;,
  0.110120;0.292440;,
  0.110120;0.292440;,
  0.110120;0.292440;,
  0.597550;0.948540;,
  0.596770;0.961200;,
  0.855580;0.710670;,
  0.846980;0.704230;;
 }
}
