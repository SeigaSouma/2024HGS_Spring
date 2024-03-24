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
 264;
 -2.19720;4.73070;-4.41234;,
 -2.96705;0.00000;-1.01126;,
 -2.66544;5.04809;-0.87867;,
 -2.19720;4.73070;-4.41234;,
 -2.66544;5.04809;-0.87867;,
 -1.77083;5.94660;-0.58433;,
 -1.23466;5.66157;-4.65041;,
 0.00000;6.99262;0.00000;,
 0.61260;6.81170;-4.56612;,
 8.07919;9.34767;2.90409;,
 8.54849;10.29165;-1.49204;,
 18.69029;9.40748;6.35326;,
 19.56778;9.62671;1.44789;,
 34.04057;5.53314;9.17216;,
 34.50677;4.93166;4.93382;,
 34.87166;5.32705;9.38925;,
 35.32333;4.77060;5.30007;,
 35.45335;4.83362;9.54481;,
 35.86213;4.33441;5.83018;,
 35.86213;4.33441;5.83018;,
 35.45335;4.83362;9.54481;,
 36.10633;2.70004;9.71299;,
 36.32001;2.41199;7.65726;,
 36.14187;0.28607;9.66109;,
 -1.76468;3.24526;-7.26471;,
 -1.76468;3.24526;-7.26471;,
 -0.77044;3.89469;-7.98203;,
 1.05891;4.69847;-8.42654;,
 9.06936;7.27400;-6.58615;,
 19.45776;5.59385;-3.63131;,
 34.88582;3.41688;1.55913;,
 35.68980;3.31190;2.03341;,
 36.19183;3.01241;2.85835;,
 36.19183;3.01241;2.85835;,
 36.48825;1.70910;6.01002;,
 -1.38669;0.98488;-8.82082;,
 -1.38669;0.98488;-8.82082;,
 -0.33628;1.17531;-9.81799;,
 1.51595;1.43059;-10.60055;,
 9.64562;1.99112;-10.52741;,
 19.87991;1.65518;-6.79433;,
 35.08086;1.23343;-0.33550;,
 35.87557;1.20369;0.19367;,
 36.35621;1.11435;1.17619;,
 36.35621;1.11435;1.17619;,
 36.57304;0.72228;5.06594;,
 -1.19626;-1.38883;-8.75461;,
 -1.19626;-1.38883;-8.75461;,
 -0.08563;-1.62048;-9.74010;,
 1.80331;-1.81543;-10.54232;,
 9.50514;-1.87662;-10.38620;,
 20.06451;-1.74103;-6.95600;,
 35.03968;-1.10005;-0.42919;,
 35.83190;-1.04077;0.09180;,
 36.31476;-0.89905;1.06900;,
 36.31476;-0.89905;1.06900;,
 36.55333;-0.33682;4.99096;,
 -1.35496;-3.35486;-7.14534;,
 -1.35496;-3.35486;-7.14534;,
 -0.28145;-3.88886;-7.88602;,
 1.54978;-4.40300;-8.45321;,
 9.10699;-5.63030;-7.62302;,
 19.71129;-5.16237;-4.24054;,
 34.82508;-2.91746;1.22227;,
 35.58970;-2.81298;1.67477;,
 36.08280;-2.51734;2.50519;,
 36.08280;-2.51734;2.50519;,
 36.43756;-1.24416;5.80379;,
 -1.87817;-4.58099;-4.35611;,
 -1.87817;-4.58099;-4.35611;,
 -0.91661;-5.28841;-4.67176;,
 0.80658;-6.01261;-4.79221;,
 8.43384;-8.51580;-2.81556;,
 19.30590;-7.95698;1.04423;,
 34.45422;-3.82906;4.29725;,
 35.21354;-3.78454;4.68162;,
 35.73716;-3.46945;5.27553;,
 35.73716;-3.46945;5.27553;,
 36.26095;-1.82814;7.40272;,
 -2.54008;-4.91514;-0.87275;,
 -2.54008;-4.91514;-0.87275;,
 -1.70377;-5.65918;-0.64809;,
 -0.06751;-6.40469;-0.20865;,
 7.75254;-8.87991;2.64106;,
 18.46928;-8.51301;6.49897;,
 33.96601;-4.13523;8.65530;,
 34.79243;-4.13658;8.93985;,
 35.38080;-3.81991;9.16015;,
 35.38080;-3.81991;9.16015;,
 36.06294;-2.02665;9.51496;,
 -3.10507;-4.35552;2.67227;,
 -3.10507;-4.35552;2.67227;,
 -2.54008;-4.91514;-0.87275;,
 -1.70377;-5.65918;-0.64809;,
 -2.33706;-5.02066;3.47016;,
 -0.06751;-6.40469;-0.20865;,
 -0.74529;-5.68384;4.49697;,
 7.75254;-8.87991;2.64106;,
 7.12640;-7.33761;7.90797;,
 18.46928;-8.51301;6.49897;,
 17.92623;-6.53917;11.41209;,
 33.96601;-4.13523;8.65530;,
 33.70372;-3.37650;13.68196;,
 34.79243;-4.13658;8.93985;,
 34.49281;-3.54183;13.67759;,
 35.38080;-3.81991;9.16015;,
 35.07158;-3.35928;13.36987;,
 35.07158;-3.35928;13.36987;,
 35.87369;-1.78009;11.70535;,
 -3.50333;-2.99294;5.54943;,
 -3.50333;-2.99294;5.54943;,
 -2.77050;-3.45934;6.81711;,
 -1.19955;-3.93152;8.32584;,
 6.63440;-4.63278;12.08969;,
 17.57664;-3.90677;15.23747;,
 33.80453;-0.74625;18.05074;,
 34.50525;-1.19314;17.73222;,
 34.99855;-1.47679;16.90670;,
 34.99855;-1.47679;16.90670;,
 35.72244;-1.08827;13.47084;,
 -3.68726;-1.08458;7.16696;,
 -3.68726;-1.08458;7.16696;,
 -2.98176;-1.25154;8.69035;,
 -1.43986;-1.42006;10.45673;,
 6.37767;-1.03367;14.24599;,
 17.28514;-1.42368;17.34203;,
 33.50613;0.87393;19.77998;,
 34.26747;0.60160;19.46870;,
 34.83335;0.33747;18.56525;,
 34.83335;0.33747;18.56525;,
 35.64380;-0.08770;14.43409;,
 -3.68690;1.03369;7.16778;,
 -3.68690;1.03369;7.16778;,
 -2.98151;1.19970;8.69066;,
 -1.43808;1.37634;10.46098;,
 6.97260;2.81938;14.38202;,
 17.31557;1.45132;17.23029;,
 33.25324;2.20137;19.31247;,
 34.05222;2.02475;19.06889;,
 34.67486;1.80296;18.26374;,
 34.67486;1.80296;18.26374;,
 35.63309;0.94608;14.40484;,
 -3.49310;2.98008;5.56596;,
 -3.49310;2.98008;5.56596;,
 -2.75581;3.45312;6.83504;,
 -1.17387;3.94982;8.35072;,
 7.83568;5.69561;12.48839;,
 18.09835;4.88508;15.15908;,
 33.27611;3.73979;17.04818;,
 34.10025;3.58944;16.93378;,
 34.74052;3.27635;16.36925;,
 34.74052;3.27635;16.36925;,
 35.72027;1.86541;13.44758;,
 -3.12917;4.39516;2.68352;,
 -3.12917;4.39516;2.68352;,
 -2.32830;5.10399;3.50096;,
 -0.67214;5.86246;4.56801;,
 7.39381;7.54669;7.85805;,
 18.05701;7.34034;11.24584;,
 33.58111;5.10160;13.45410;,
 34.42539;4.90717;13.52040;,
 35.04937;4.45063;13.29863;,
 35.04937;4.45063;13.29863;,
 35.89155;2.50151;11.77588;,
 41.15119;-4.49659;12.13135;,
 41.38829;-4.42087;10.34001;,
 43.44189;-3.16507;10.43978;,
 43.00046;-3.21857;13.58479;,
 40.45761;-4.46783;13.58703;,
 41.73542;-3.13780;16.12326;,
 39.44761;-4.36746;14.41787;,
 39.91332;-2.94781;17.61536;,
 38.32109;-4.22457;14.45226;,
 37.92190;-2.64547;17.77283;,
 37.29639;-4.06998;13.65166;,
 36.15450;-2.26919;16.51612;,
 36.56913;-3.92366;12.14045;,
 34.82144;-2.16997;13.83880;,
 36.28113;-3.81464;10.22545;,
 34.24258;-2.20574;10.32418;,
 36.49747;-3.78721;8.33959;,
 36.28113;-3.81464;10.22545;,
 34.24258;-2.20574;10.32418;,
 34.63553;-2.32651;6.95944;,
 37.18287;-3.84199;6.88491;,
 35.88903;-2.56204;4.43076;,
 38.20052;-3.92202;6.13697;,
 37.73888;-2.70842;3.13299;,
 39.34331;-4.02195;6.19911;,
 39.79388;-2.80813;3.19903;,
 40.38358;-4.14827;7.05026;,
 41.66019;-2.90215;4.65722;,
 41.11448;-4.29110;8.52922;,
 42.96542;-3.03454;7.24741;,
 41.38829;-4.42087;10.34001;,
 43.44189;-3.16507;10.43978;,
 44.59663;-1.13644;10.48720;,
 44.01971;-1.16560;14.35222;,
 42.43763;-1.13281;17.47811;,
 40.16135;-0.95917;19.30182;,
 37.68856;-0.59660;19.48194;,
 35.52698;-0.06910;18.00674;,
 33.92646;0.09321;14.86643;,
 33.14040;-0.20861;10.49324;,
 33.14040;-0.20861;10.49324;,
 33.63015;-0.51577;6.35078;,
 35.21590;-0.82996;3.24057;,
 37.52775;-0.95678;1.60093;,
 40.09425;-0.99518;1.65280;,
 42.41452;-1.00428;3.43074;,
 44.02456;-1.06771;6.59151;,
 44.59663;-1.13644;10.48720;,
 44.60414;1.16608;10.49648;,
 44.01971;1.11299;14.35222;,
 42.43512;1.11534;17.46074;,
 40.15279;1.20413;19.23533;,
 37.62959;1.37896;19.33215;,
 35.40373;1.66036;17.75562;,
 33.83111;1.84130;14.69126;,
 33.14482;1.71003;10.55129;,
 33.14482;1.71003;10.55129;,
 33.66680;1.45836;6.50405;,
 35.25642;1.23503;3.38613;,
 37.57538;1.18355;1.72038;,
 40.15010;1.21286;1.76719;,
 42.47477;1.27846;3.54135;,
 44.06081;1.23463;6.64783;,
 44.60414;1.16608;10.49648;,
 43.46907;3.20871;10.49290;,
 43.00046;3.16597;13.58479;,
 41.72950;3.16597;16.07662;,
 39.89490;3.18485;17.46991;,
 37.86266;3.25497;17.50953;,
 36.03280;3.33961;16.17513;,
 34.75963;3.38949;13.69995;,
 34.28267;3.37713;10.52750;,
 34.28267;3.37713;10.52750;,
 34.72050;3.26937;7.34694;,
 35.99646;3.19321;4.84693;,
 37.85531;3.20505;3.49236;,
 39.91724;3.24476;3.52064;,
 41.76719;3.27614;4.91884;,
 43.03265;3.26038;7.40499;,
 43.46907;3.20871;10.49290;,
 41.42043;4.59881;10.48147;,
 41.16387;4.58666;12.20193;,
 40.45854;4.58666;13.58479;,
 39.43930;4.58666;14.35222;,
 38.30893;4.59440;14.35644;,
 37.29107;4.60939;13.59745;,
 36.58623;4.61555;12.21812;,
 36.33270;4.60308;10.48605;,
 36.33270;4.60308;10.48605;,
 36.58095;4.58786;8.75048;,
 37.28730;4.58712;7.36883;,
 38.31338;4.59948;6.60679;,
 39.45088;4.61840;6.61392;,
 40.47280;4.62687;7.38462;,
 41.17529;4.61862;8.76447;,
 41.42043;4.59881;10.48147;,
 38.83172;-4.64781;10.23927;,
 38.87367;5.09371;10.47753;,
 38.83172;-4.64781;10.23927;,
 38.87367;5.09371;10.47753;;
 
 238;
 3;0,1,2;,
 4;3,4,5,6;,
 4;6,5,7,8;,
 4;8,7,9,10;,
 4;10,9,11,12;,
 4;12,11,13,14;,
 4;14,13,15,16;,
 4;16,15,17,18;,
 4;19,20,21,22;,
 3;22,21,23;,
 3;24,1,0;,
 4;25,3,6,26;,
 4;26,6,8,27;,
 4;27,8,10,28;,
 4;28,10,12,29;,
 4;29,12,14,30;,
 4;30,14,16,31;,
 4;31,16,18,32;,
 4;33,19,22,34;,
 3;34,22,23;,
 3;35,1,24;,
 4;36,25,26,37;,
 4;37,26,27,38;,
 4;38,27,28,39;,
 4;39,28,29,40;,
 4;40,29,30,41;,
 4;41,30,31,42;,
 4;42,31,32,43;,
 4;44,33,34,45;,
 3;45,34,23;,
 3;46,1,35;,
 4;47,36,37,48;,
 4;48,37,38,49;,
 4;49,38,39,50;,
 4;50,39,40,51;,
 4;51,40,41,52;,
 4;52,41,42,53;,
 4;53,42,43,54;,
 4;55,44,45,56;,
 3;56,45,23;,
 3;57,1,46;,
 4;58,47,48,59;,
 4;59,48,49,60;,
 4;60,49,50,61;,
 4;61,50,51,62;,
 4;62,51,52,63;,
 4;63,52,53,64;,
 4;64,53,54,65;,
 4;66,55,56,67;,
 3;67,56,23;,
 3;68,1,57;,
 4;69,58,59,70;,
 4;70,59,60,71;,
 4;71,60,61,72;,
 4;72,61,62,73;,
 4;73,62,63,74;,
 4;74,63,64,75;,
 4;75,64,65,76;,
 4;77,66,67,78;,
 3;78,67,23;,
 3;79,1,68;,
 4;80,69,70,81;,
 4;81,70,71,82;,
 4;82,71,72,83;,
 4;83,72,73,84;,
 4;84,73,74,85;,
 4;85,74,75,86;,
 4;86,75,76,87;,
 4;88,77,78,89;,
 3;89,78,23;,
 3;90,1,79;,
 4;91,92,93,94;,
 4;94,93,95,96;,
 4;96,95,97,98;,
 4;98,97,99,100;,
 4;100,99,101,102;,
 4;102,101,103,104;,
 4;104,103,105,106;,
 4;107,88,89,108;,
 3;108,89,23;,
 3;109,1,90;,
 4;110,91,94,111;,
 4;111,94,96,112;,
 4;112,96,98,113;,
 4;113,98,100,114;,
 4;114,100,102,115;,
 4;115,102,104,116;,
 4;116,104,106,117;,
 4;118,107,108,119;,
 3;119,108,23;,
 3;120,1,109;,
 4;121,110,111,122;,
 4;122,111,112,123;,
 4;123,112,113,124;,
 4;124,113,114,125;,
 4;125,114,115,126;,
 4;126,115,116,127;,
 4;127,116,117,128;,
 4;129,118,119,130;,
 3;130,119,23;,
 3;131,1,120;,
 4;132,121,122,133;,
 4;133,122,123,134;,
 4;134,123,124,135;,
 4;135,124,125,136;,
 4;136,125,126,137;,
 4;137,126,127,138;,
 4;138,127,128,139;,
 4;140,129,130,141;,
 3;141,130,23;,
 3;142,1,131;,
 4;143,132,133,144;,
 4;144,133,134,145;,
 4;145,134,135,146;,
 4;146,135,136,147;,
 4;147,136,137,148;,
 4;148,137,138,149;,
 4;149,138,139,150;,
 4;151,140,141,152;,
 3;152,141,23;,
 3;153,1,142;,
 4;154,143,144,155;,
 4;155,144,145,156;,
 4;156,145,146,157;,
 4;157,146,147,158;,
 4;158,147,148,159;,
 4;159,148,149,160;,
 4;160,149,150,161;,
 4;162,151,152,163;,
 3;163,152,23;,
 3;2,1,153;,
 4;4,154,155,5;,
 4;5,155,156,7;,
 4;7,156,157,9;,
 4;9,157,158,11;,
 4;11,158,159,13;,
 4;13,159,160,15;,
 4;15,160,161,17;,
 4;20,162,163,21;,
 3;21,163,23;,
 4;164,165,166,167;,
 4;168,164,167,169;,
 4;170,168,169,171;,
 4;172,170,171,173;,
 4;174,172,173,175;,
 4;176,174,175,177;,
 4;178,176,177,179;,
 4;180,181,182,183;,
 4;184,180,183,185;,
 4;186,184,185,187;,
 4;188,186,187,189;,
 4;190,188,189,191;,
 4;192,190,191,193;,
 4;194,192,193,195;,
 4;167,166,196,197;,
 4;169,167,197,198;,
 4;171,169,198,199;,
 4;173,171,199,200;,
 4;175,173,200,201;,
 4;177,175,201,202;,
 4;179,177,202,203;,
 4;183,182,204,205;,
 4;185,183,205,206;,
 4;187,185,206,207;,
 4;189,187,207,208;,
 4;191,189,208,209;,
 4;193,191,209,210;,
 4;195,193,210,211;,
 4;197,196,212,213;,
 4;198,197,213,214;,
 4;199,198,214,215;,
 4;200,199,215,216;,
 4;201,200,216,217;,
 4;202,201,217,218;,
 4;203,202,218,219;,
 4;205,204,220,221;,
 4;206,205,221,222;,
 4;207,206,222,223;,
 4;208,207,223,224;,
 4;209,208,224,225;,
 4;210,209,225,226;,
 4;211,210,226,227;,
 4;213,212,228,229;,
 4;214,213,229,230;,
 4;215,214,230,231;,
 4;216,215,231,232;,
 4;217,216,232,233;,
 4;218,217,233,234;,
 4;219,218,234,235;,
 4;221,220,236,237;,
 4;222,221,237,238;,
 4;223,222,238,239;,
 4;224,223,239,240;,
 4;225,224,240,241;,
 4;226,225,241,242;,
 4;227,226,242,243;,
 4;229,228,244,245;,
 4;230,229,245,246;,
 4;231,230,246,247;,
 4;232,231,247,248;,
 4;233,232,248,249;,
 4;234,233,249,250;,
 4;235,234,250,251;,
 4;237,236,252,253;,
 4;238,237,253,254;,
 4;239,238,254,255;,
 4;240,239,255,256;,
 4;241,240,256,257;,
 4;242,241,257,258;,
 4;243,242,258,259;,
 3;164,260,165;,
 3;261,245,244;,
 3;168,260,164;,
 3;261,246,245;,
 3;170,260,168;,
 3;261,247,246;,
 3;172,260,170;,
 3;261,248,247;,
 3;174,260,172;,
 3;261,249,248;,
 3;176,260,174;,
 3;261,250,249;,
 3;178,260,176;,
 3;261,251,250;,
 3;180,262,181;,
 3;263,253,252;,
 3;184,262,180;,
 3;263,254,253;,
 3;186,262,184;,
 3;263,255,254;,
 3;188,262,186;,
 3;263,256,255;,
 3;190,262,188;,
 3;263,257,256;,
 3;192,262,190;,
 3;263,258,257;,
 3;194,262,192;,
 3;263,259,258;;
 
 MeshMaterialList {
  1;
  238;
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
    "C:\\Users\\student\\Desktop\\�A�E��i\\2024_01Action\\202401_Action\\data\\TEXTURE\\enemy\\practice\\practiceUV.png";
   }
  }
 }
 MeshNormals {
  214;
  -0.988708;-0.021269;-0.148338;,
  0.995111;-0.012501;0.097965;,
  -0.905214;0.413978;-0.095967;,
  -0.609058;0.792758;-0.024160;,
  -0.426362;0.901747;0.071190;,
  -0.200933;0.960797;0.191036;,
  0.076236;0.979545;0.186226;,
  0.221619;0.972783;0.067656;,
  0.446533;0.894146;0.033334;,
  0.827236;0.556138;0.079944;,
  0.982516;0.156651;0.100612;,
  -0.896613;0.376893;-0.232457;,
  -0.595252;0.748429;-0.292454;,
  -0.382006;0.883551;-0.270939;,
  -0.077854;0.968227;-0.237645;,
  0.221506;0.945527;-0.238566;,
  0.302396;0.922092;-0.241462;,
  0.508214;0.841869;-0.181591;,
  0.862169;0.504559;-0.045653;,
  0.988202;0.137940;0.066559;,
  -0.888754;0.251841;-0.383005;,
  -0.572753;0.558525;-0.600003;,
  -0.269067;0.690990;-0.670922;,
  0.091814;0.733406;-0.673562;,
  0.302805;0.720013;-0.624412;,
  0.367816;0.743534;-0.558453;,
  0.619648;0.665377;-0.416305;,
  0.917162;0.364792;-0.160438;,
  0.995119;0.091049;0.038054;,
  -0.878653;0.038551;-0.475902;,
  -0.560880;0.174705;-0.809253;,
  -0.211275;0.256863;-0.943072;,
  0.165866;0.309796;-0.936224;,
  0.353574;0.338114;-0.872161;,
  0.455983;0.343964;-0.820834;,
  0.737245;0.277561;-0.615978;,
  0.962868;0.132046;-0.235475;,
  0.999575;0.020059;0.021166;,
  -0.864684;-0.185835;-0.466676;,
  -0.544356;-0.298956;-0.783774;,
  -0.200300;-0.335441;-0.920521;,
  0.160360;-0.328887;-0.930655;,
  0.351141;-0.313635;-0.882232;,
  0.467714;-0.317054;-0.825058;,
  0.742652;-0.276968;-0.609718;,
  0.960723;-0.156877;-0.228911;,
  0.997746;-0.063370;0.022058;,
  -0.856672;-0.341744;-0.386425;,
  -0.517853;-0.642769;-0.564515;,
  -0.224874;-0.743124;-0.630237;,
  0.087503;-0.762203;-0.641397;,
  0.280120;-0.766791;-0.577550;,
  0.343009;-0.797077;-0.497004;,
  0.582332;-0.722823;-0.372042;,
  0.894724;-0.423707;-0.141211;,
  0.989357;-0.140273;0.038676;,
  -0.861142;-0.428862;-0.272967;,
  -0.509179;-0.805270;-0.303772;,
  -0.292463;-0.908029;-0.299914;,
  -0.032777;-0.955769;-0.292286;,
  0.213589;-0.948126;-0.235448;,
  0.217965;-0.959080;-0.180714;,
  0.379394;-0.915380;-0.134681;,
  0.803452;-0.594397;-0.034022;,
  0.979954;-0.189639;0.061059;,
  -0.878967;-0.456018;-0.139517;,
  -0.533290;-0.843380;-0.065669;,
  -0.353446;-0.935426;-0.007409;,
  -0.148480;-0.985957;0.076437;,
  0.121552;-0.985178;0.121033;,
  0.100283;-0.992307;0.072599;,
  0.217161;-0.975176;0.043274;,
  0.739100;-0.669552;0.073700;,
  0.974729;-0.205318;0.088023;,
  -0.911472;-0.411209;-0.011210;,
  -0.603247;-0.783418;0.149496;,
  -0.404177;-0.881074;0.245660;,
  -0.205080;-0.905733;0.370932;,
  0.025917;-0.904101;0.426532;,
  -0.024591;-0.928265;0.371105;,
  0.115055;-0.939681;0.322120;,
  0.727599;-0.642780;0.239654;,
  0.975867;-0.181230;0.121816;,
  -0.952379;-0.290304;0.093265;,
  -0.718583;-0.597378;0.356060;,
  -0.489131;-0.702235;0.517317;,
  -0.262379;-0.722779;0.639334;,
  -0.063490;-0.748321;0.660291;,
  -0.053502;-0.779916;0.623594;,
  0.217649;-0.766882;0.603755;,
  0.813428;-0.443137;0.376781;,
  0.983425;-0.108971;0.144917;,
  -0.982182;-0.104940;0.155907;,
  -0.827345;-0.233711;0.510764;,
  -0.592680;-0.282529;0.754260;,
  -0.340623;-0.290671;0.894140;,
  -0.176709;-0.294047;0.939314;,
  0.054848;-0.266174;0.962363;,
  0.568408;-0.183429;0.802039;,
  0.918387;-0.064518;0.390387;,
  0.988443;-0.006893;0.151438;,
  -0.982091;0.105316;0.156225;,
  -0.828038;0.230172;0.511248;,
  -0.606153;0.296508;0.738012;,
  -0.338761;0.313266;0.887190;,
  -0.177500;0.376918;0.909080;,
  0.115911;0.534302;0.837309;,
  0.589389;0.507684;0.628393;,
  0.895424;0.271392;0.352934;,
  0.984804;0.073558;0.157325;,
  -0.954000;0.283206;0.098378;,
  -0.726786;0.583481;0.362397;,
  -0.511574;0.703242;0.493704;,
  -0.262243;0.750475;0.606644;,
  -0.077381;0.776738;0.625052;,
  0.108409;0.838493;0.534020;,
  0.471592;0.764668;0.439185;,
  0.843473;0.440649;0.307214;,
  0.980631;0.117395;0.156787;,
  -0.922739;0.385319;0.009069;,
  -0.639238;0.748873;0.174827;,
  -0.434769;0.860273;0.266281;,
  -0.215607;0.907818;0.359694;,
  -0.003858;0.924392;0.381425;,
  0.148555;0.941939;0.301135;,
  0.429531;0.867972;0.249255;,
  0.820975;0.531253;0.209212;,
  0.979870;0.147006;0.135070;,
  -0.109867;-0.993163;-0.039453;,
  -0.000393;0.999998;0.001956;,
  0.314322;-0.948014;-0.049701;,
  0.278736;-0.957560;0.073381;,
  0.163462;-0.969523;0.182495;,
  -0.013837;-0.970377;0.241201;,
  -0.216628;-0.946941;0.237433;,
  -0.377735;-0.908487;0.178797;,
  -0.459252;-0.883926;0.088112;,
  -0.473658;-0.880657;-0.009509;,
  -0.431128;-0.896726;-0.100056;,
  -0.319261;-0.928843;-0.187946;,
  -0.152467;-0.955641;-0.252001;,
  0.021848;-0.964156;-0.264434;,
  0.170330;-0.958666;-0.227921;,
  0.272504;-0.949845;-0.153414;,
  0.717800;-0.695765;-0.025959;,
  0.671730;-0.711739;0.205442;,
  0.488022;-0.760396;0.428524;,
  0.141763;-0.803687;0.577919;,
  -0.291412;-0.774119;0.561977;,
  -0.603245;-0.687265;0.404676;,
  -0.736984;-0.639148;0.219873;,
  -0.764656;-0.643798;0.028721;,
  -0.709390;-0.683874;-0.170537;,
  -0.536001;-0.752883;-0.381929;,
  -0.216933;-0.810634;-0.543886;,
  0.166195;-0.813600;-0.557167;,
  0.475587;-0.767242;-0.430300;,
  0.652952;-0.718191;-0.240531;,
  0.965983;-0.258573;-0.004138;,
  0.919007;-0.265171;0.291737;,
  0.734273;-0.297545;0.610173;,
  0.310512;-0.328520;0.891996;,
  -0.308119;-0.308972;0.899777;,
  -0.749412;-0.265253;0.606649;,
  -0.919112;-0.250415;0.304181;,
  -0.968061;-0.248064;0.036354;,
  -0.931123;-0.253346;-0.262346;,
  -0.741687;-0.282252;-0.608468;,
  -0.293493;-0.323462;-0.899575;,
  0.308167;-0.331605;-0.891667;,
  0.729990;-0.302976;-0.612634;,
  0.914272;-0.274606;-0.297822;,
  0.968458;0.249057;0.007721;,
  0.918524;0.263030;0.295175;,
  0.738686;0.305981;0.600599;,
  0.339108;0.373613;0.863377;,
  -0.230850;0.413117;0.880933;,
  -0.687888;0.376763;0.620370;,
  -0.901365;0.313099;0.299182;,
  -0.955883;0.293641;0.007964;,
  -0.901944;0.317142;-0.293116;,
  -0.704453;0.355064;-0.614553;,
  -0.277532;0.385927;-0.879794;,
  0.303269;0.369443;-0.878373;,
  0.730879;0.310254;-0.607913;,
  0.921084;0.263225;-0.286908;,
  0.737421;0.675316;0.012586;,
  0.687626;0.691229;0.222202;,
  0.520988;0.743382;0.419469;,
  0.222052;0.804196;0.551327;,
  -0.137611;0.828516;0.542793;,
  -0.440563;0.802407;0.402552;,
  -0.624627;0.754057;0.203073;,
  -0.687564;0.726063;-0.009372;,
  -0.642646;0.733539;-0.221193;,
  -0.485164;0.767578;-0.418855;,
  -0.191056;0.805909;-0.560364;,
  0.188283;0.803695;-0.564468;,
  0.507517;0.753183;-0.418499;,
  0.685423;0.698633;-0.205198;,
  0.383748;0.923367;0.011404;,
  0.353042;0.928520;0.114946;,
  0.254165;0.945380;0.204101;,
  0.100910;0.961256;0.256524;,
  -0.068012;0.965411;0.251706;,
  -0.218440;0.956357;0.194077;,
  -0.321160;0.941691;0.100374;,
  -0.358624;0.933441;-0.008798;,
  -0.332273;0.936330;-0.113492;,
  -0.245233;0.948477;-0.200630;,
  -0.100192;0.961927;-0.254278;,
  0.077689;0.964070;-0.254033;,
  0.240551;0.950732;-0.195561;,
  0.347396;0.932596;-0.097884;;
  238;
  3;11,0,2;,
  4;11,2,3,12;,
  4;12,3,4,13;,
  4;13,4,5,14;,
  4;14,5,6,15;,
  4;15,6,7,16;,
  4;16,7,8,17;,
  4;17,8,9,18;,
  4;18,9,10,19;,
  3;19,10,1;,
  3;20,0,11;,
  4;20,11,12,21;,
  4;21,12,13,22;,
  4;22,13,14,23;,
  4;23,14,15,24;,
  4;24,15,16,25;,
  4;25,16,17,26;,
  4;26,17,18,27;,
  4;27,18,19,28;,
  3;28,19,1;,
  3;29,0,20;,
  4;29,20,21,30;,
  4;30,21,22,31;,
  4;31,22,23,32;,
  4;32,23,24,33;,
  4;33,24,25,34;,
  4;34,25,26,35;,
  4;35,26,27,36;,
  4;36,27,28,37;,
  3;37,28,1;,
  3;38,0,29;,
  4;38,29,30,39;,
  4;39,30,31,40;,
  4;40,31,32,41;,
  4;41,32,33,42;,
  4;42,33,34,43;,
  4;43,34,35,44;,
  4;44,35,36,45;,
  4;45,36,37,46;,
  3;46,37,1;,
  3;47,0,38;,
  4;47,38,39,48;,
  4;48,39,40,49;,
  4;49,40,41,50;,
  4;50,41,42,51;,
  4;51,42,43,52;,
  4;52,43,44,53;,
  4;53,44,45,54;,
  4;54,45,46,55;,
  3;55,46,1;,
  3;56,0,47;,
  4;56,47,48,57;,
  4;57,48,49,58;,
  4;58,49,50,59;,
  4;59,50,51,60;,
  4;60,51,52,61;,
  4;61,52,53,62;,
  4;62,53,54,63;,
  4;63,54,55,64;,
  3;64,55,1;,
  3;65,0,56;,
  4;65,56,57,66;,
  4;66,57,58,67;,
  4;67,58,59,68;,
  4;68,59,60,69;,
  4;69,60,61,70;,
  4;70,61,62,71;,
  4;71,62,63,72;,
  4;72,63,64,73;,
  3;73,64,1;,
  3;74,0,65;,
  4;74,65,66,75;,
  4;75,66,67,76;,
  4;76,67,68,77;,
  4;77,68,69,78;,
  4;78,69,70,79;,
  4;79,70,71,80;,
  4;80,71,72,81;,
  4;81,72,73,82;,
  3;82,73,1;,
  3;83,0,74;,
  4;83,74,75,84;,
  4;84,75,76,85;,
  4;85,76,77,86;,
  4;86,77,78,87;,
  4;87,78,79,88;,
  4;88,79,80,89;,
  4;89,80,81,90;,
  4;90,81,82,91;,
  3;91,82,1;,
  3;92,0,83;,
  4;92,83,84,93;,
  4;93,84,85,94;,
  4;94,85,86,95;,
  4;95,86,87,96;,
  4;96,87,88,97;,
  4;97,88,89,98;,
  4;98,89,90,99;,
  4;99,90,91,100;,
  3;100,91,1;,
  3;101,0,92;,
  4;101,92,93,102;,
  4;102,93,94,103;,
  4;103,94,95,104;,
  4;104,95,96,105;,
  4;105,96,97,106;,
  4;106,97,98,107;,
  4;107,98,99,108;,
  4;108,99,100,109;,
  3;109,100,1;,
  3;110,0,101;,
  4;110,101,102,111;,
  4;111,102,103,112;,
  4;112,103,104,113;,
  4;113,104,105,114;,
  4;114,105,106,115;,
  4;115,106,107,116;,
  4;116,107,108,117;,
  4;117,108,109,118;,
  3;118,109,1;,
  3;119,0,110;,
  4;119,110,111,120;,
  4;120,111,112,121;,
  4;121,112,113,122;,
  4;122,113,114,123;,
  4;123,114,115,124;,
  4;124,115,116,125;,
  4;125,116,117,126;,
  4;126,117,118,127;,
  3;127,118,1;,
  3;2,0,119;,
  4;2,119,120,3;,
  4;3,120,121,4;,
  4;4,121,122,5;,
  4;5,122,123,6;,
  4;6,123,124,7;,
  4;7,124,125,8;,
  4;8,125,126,9;,
  4;9,126,127,10;,
  3;10,127,1;,
  4;131,130,144,145;,
  4;132,131,145,146;,
  4;133,132,146,147;,
  4;134,133,147,148;,
  4;135,134,148,149;,
  4;136,135,149,150;,
  4;137,136,150,151;,
  4;138,137,151,152;,
  4;139,138,152,153;,
  4;140,139,153,154;,
  4;141,140,154,155;,
  4;142,141,155,156;,
  4;143,142,156,157;,
  4;130,143,157,144;,
  4;145,144,158,159;,
  4;146,145,159,160;,
  4;147,146,160,161;,
  4;148,147,161,162;,
  4;149,148,162,163;,
  4;150,149,163,164;,
  4;151,150,164,165;,
  4;152,151,165,166;,
  4;153,152,166,167;,
  4;154,153,167,168;,
  4;155,154,168,169;,
  4;156,155,169,170;,
  4;157,156,170,171;,
  4;144,157,171,158;,
  4;159,158,172,173;,
  4;160,159,173,174;,
  4;161,160,174,175;,
  4;162,161,175,176;,
  4;163,162,176,177;,
  4;164,163,177,178;,
  4;165,164,178,179;,
  4;166,165,179,180;,
  4;167,166,180,181;,
  4;168,167,181,182;,
  4;169,168,182,183;,
  4;170,169,183,184;,
  4;171,170,184,185;,
  4;158,171,185,172;,
  4;173,172,186,187;,
  4;174,173,187,188;,
  4;175,174,188,189;,
  4;176,175,189,190;,
  4;177,176,190,191;,
  4;178,177,191,192;,
  4;179,178,192,193;,
  4;180,179,193,194;,
  4;181,180,194,195;,
  4;182,181,195,196;,
  4;183,182,196,197;,
  4;184,183,197,198;,
  4;185,184,198,199;,
  4;172,185,199,186;,
  4;187,186,200,201;,
  4;188,187,201,202;,
  4;189,188,202,203;,
  4;190,189,203,204;,
  4;191,190,204,205;,
  4;192,191,205,206;,
  4;193,192,206,207;,
  4;194,193,207,208;,
  4;195,194,208,209;,
  4;196,195,209,210;,
  4;197,196,210,211;,
  4;198,197,211,212;,
  4;199,198,212,213;,
  4;186,199,213,200;,
  3;131,128,130;,
  3;129,201,200;,
  3;132,128,131;,
  3;129,202,201;,
  3;133,128,132;,
  3;129,203,202;,
  3;134,128,133;,
  3;129,204,203;,
  3;135,128,134;,
  3;129,205,204;,
  3;136,128,135;,
  3;129,206,205;,
  3;137,128,136;,
  3;129,207,206;,
  3;138,128,137;,
  3;129,208,207;,
  3;139,128,138;,
  3;129,209,208;,
  3;140,128,139;,
  3;129,210,209;,
  3;141,128,140;,
  3;129,211,210;,
  3;142,128,141;,
  3;129,212,211;,
  3;143,128,142;,
  3;129,213,212;,
  3;130,128,143;,
  3;129,200,213;;
 }
 MeshTextureCoords {
  264;
  0.995020;0.551530;,
  0.971370;0.535630;,
  0.995020;0.535180;,
  0.250380;0.616230;,
  0.208330;0.616230;,
  0.208310;0.611260;,
  0.249670;0.611180;,
  0.208000;0.603620;,
  0.247560;0.603440;,
  0.204670;0.572440;,
  0.234430;0.572470;,
  0.199700;0.530690;,
  0.232750;0.529960;,
  0.215910;0.471170;,
  0.266980;0.470970;,
  0.216120;0.468090;,
  0.267030;0.467900;,
  0.216360;0.465080;,
  0.267100;0.465080;,
  0.591760;0.222340;,
  0.572250;0.222340;,
  0.572600;0.212460;,
  0.583030;0.212190;,
  0.573760;0.201860;,
  0.989920;0.565040;,
  0.280290;0.616230;,
  0.280160;0.611210;,
  0.279310;0.603740;,
  0.270940;0.572760;,
  0.273260;0.531500;,
  0.295170;0.470940;,
  0.295250;0.467860;,
  0.295470;0.465080;,
  0.607250;0.217360;,
  0.591430;0.209450;,
  0.977990;0.572610;,
  0.302790;0.616230;,
  0.303210;0.611120;,
  0.303830;0.603690;,
  0.303320;0.571500;,
  0.299620;0.531590;,
  0.313370;0.471080;,
  0.313530;0.468000;,
  0.313940;0.465080;,
  0.615450;0.207570;,
  0.596220;0.204850;,
  0.964420;0.572610;,
  0.322000;0.616230;,
  0.322080;0.610950;,
  0.322750;0.603360;,
  0.321550;0.572010;,
  0.315740;0.531310;,
  0.328310;0.471330;,
  0.328380;0.468310;,
  0.328580;0.465080;,
  0.615450;0.196100;,
  0.596660;0.199600;,
  0.953780;0.565260;,
  0.342280;0.616230;,
  0.342200;0.611030;,
  0.342650;0.603580;,
  0.344250;0.571840;,
  0.337300;0.531090;,
  0.343320;0.471420;,
  0.343270;0.468360;,
  0.343430;0.465080;,
  0.608310;0.187320;,
  0.592810;0.195180;,
  0.948480;0.552040;,
  0.370180;0.616230;,
  0.370110;0.611270;,
  0.370550;0.603910;,
  0.376130;0.571320;,
  0.372250;0.529740;,
  0.364070;0.471510;,
  0.364600;0.468300;,
  0.365790;0.465080;,
  0.595340;0.183350;,
  0.585260;0.192610;,
  0.948480;0.535400;,
  0.413290;0.616230;,
  0.413290;0.611390;,
  0.413290;0.603990;,
  0.413290;0.571350;,
  0.413290;0.530180;,
  0.409830;0.471790;,
  0.411560;0.468220;,
  0.413290;0.465080;,
  0.577260;0.183350;,
  0.575240;0.191710;,
  0.948480;0.518670;,
  0.047210;0.616230;,
  0.001760;0.616230;,
  0.001760;0.611390;,
  0.047780;0.611260;,
  0.001760;0.603980;,
  0.047780;0.603650;,
  0.001760;0.571370;,
  0.041870;0.571840;,
  0.001760;0.530260;,
  0.042460;0.530550;,
  0.001760;0.471770;,
  0.063140;0.471290;,
  0.003700;0.468210;,
  0.062570;0.468020;,
  0.005610;0.465080;,
  0.062350;0.465080;,
  0.557210;0.183350;,
  0.564680;0.191950;,
  0.953890;0.505180;,
  0.076870;0.616230;,
  0.077570;0.611080;,
  0.077630;0.603320;,
  0.073190;0.572580;,
  0.072810;0.531180;,
  0.101030;0.470030;,
  0.099460;0.467000;,
  0.097060;0.465080;,
  0.539440;0.191600;,
  0.555890;0.194700;,
  0.964480;0.497570;,
  0.096520;0.616230;,
  0.096580;0.610970;,
  0.096710;0.603380;,
  0.096270;0.573050;,
  0.090350;0.531740;,
  0.113200;0.470580;,
  0.113420;0.467660;,
  0.113200;0.465080;,
  0.530000;0.201340;,
  0.550680;0.199440;,
  0.977600;0.497570;,
  0.113600;0.616230;,
  0.112810;0.610980;,
  0.112860;0.603620;,
  0.116080;0.571270;,
  0.105870;0.531590;,
  0.121020;0.471440;,
  0.121790;0.468440;,
  0.122690;0.465080;,
  0.530000;0.209810;,
  0.550190;0.204610;,
  0.988080;0.505270;,
  0.133570;0.616230;,
  0.132990;0.611180;,
  0.132930;0.603860;,
  0.133640;0.569540;,
  0.127770;0.529470;,
  0.135610;0.471460;,
  0.136610;0.468330;,
  0.137580;0.465080;,
  0.538170;0.217600;,
  0.554380;0.209080;,
  0.995020;0.518410;,
  0.163530;0.616230;,
  0.163420;0.611340;,
  0.163680;0.603960;,
  0.165070;0.572860;,
  0.159240;0.530890;,
  0.164170;0.471350;,
  0.164840;0.468210;,
  0.165390;0.465080;,
  0.553100;0.222340;,
  0.562370;0.211850;,
  0.644680;0.327420;,
  0.651280;0.324500;,
  0.656700;0.335900;,
  0.645270;0.338390;,
  0.638200;0.328490;,
  0.634580;0.339080;,
  0.632370;0.328390;,
  0.626740;0.339130;,
  0.626560;0.326960;,
  0.620210;0.338080;,
  0.621590;0.324300;,
  0.614020;0.335450;,
  0.617220;0.320130;,
  0.605950;0.329400;,
  0.614520;0.314410;,
  0.598670;0.320860;,
  0.756170;0.976540;,
  0.746680;0.980650;,
  0.739250;0.964540;,
  0.755940;0.961830;,
  0.765110;0.975160;,
  0.770310;0.961750;,
  0.772810;0.975550;,
  0.780120;0.962590;,
  0.780280;0.977760;,
  0.788330;0.965050;,
  0.786370;0.981410;,
  0.796090;0.969690;,
  0.791240;0.986760;,
  0.805760;0.977120;,
  0.793650;0.993760;,
  0.813370;0.986720;,
  0.656700;0.350040;,
  0.642840;0.348480;,
  0.631380;0.346940;,
  0.623060;0.345620;,
  0.616480;0.344540;,
  0.609230;0.343300;,
  0.598800;0.339390;,
  0.585490;0.332050;,
  0.739250;0.945810;,
  0.758690;0.949920;,
  0.773660;0.953060;,
  0.784190;0.955210;,
  0.792930;0.957520;,
  0.803040;0.960950;,
  0.816530;0.966390;,
  0.831980;0.973480;,
  0.649000;0.363310;,
  0.637530;0.357730;,
  0.627660;0.353380;,
  0.620260;0.350500;,
  0.613770;0.348700;,
  0.605930;0.347750;,
  0.594500;0.346580;,
  0.579640;0.344010;,
  0.748270;0.930460;,
  0.764210;0.939210;,
  0.777400;0.945400;,
  0.787420;0.948920;,
  0.796660;0.950990;,
  0.808220;0.952470;,
  0.823700;0.954350;,
  0.842230;0.956430;,
  0.634870;0.373600;,
  0.629260;0.366330;,
  0.622040;0.360760;,
  0.616140;0.357200;,
  0.609730;0.355320;,
  0.602080;0.354920;,
  0.591350;0.355270;,
  0.579640;0.357170;,
  0.765470;0.918640;,
  0.773860;0.928510;,
  0.784070;0.935780;,
  0.792560;0.940010;,
  0.801640;0.942020;,
  0.812310;0.942230;,
  0.826830;0.941450;,
  0.842230;0.938420;,
  0.619610;0.379130;,
  0.617880;0.373980;,
  0.614110;0.370140;,
  0.609360;0.367530;,
  0.603500;0.365960;,
  0.597590;0.365650;,
  0.591020;0.366480;,
  0.584320;0.369100;,
  0.785510;0.911730;,
  0.788470;0.918380;,
  0.794040;0.923300;,
  0.800800;0.926560;,
  0.808870;0.928470;,
  0.816930;0.928740;,
  0.825720;0.927520;,
  0.834510;0.923890;,
  0.635830;0.314410;,
  0.599360;0.379130;,
  0.767170;0.993760;,
  0.813250;0.911730;;
 }
}
