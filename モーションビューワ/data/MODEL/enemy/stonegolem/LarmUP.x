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
 308;
 -1.13595;-14.17450;14.06621;,
 -0.75820;-12.25542;16.25936;,
 -1.39965;-7.36749;17.96548;,
 -3.35747;-9.36203;12.49565;,
 -1.13595;-14.17450;14.06621;,
 3.85225;-16.56504;15.74249;,
 4.23930;-11.93315;19.04921;,
 -0.75820;-12.25542;16.25936;,
 -1.39965;-7.36749;17.96548;,
 -0.75820;-12.25542;16.25936;,
 4.23930;-11.93315;19.04921;,
 3.70091;-6.52162;21.25664;,
 -2.31183;-1.53744;17.68015;,
 -4.79972;-3.25238;11.49035;,
 -1.96735;-18.07168;8.06522;,
 -4.18528;-12.00224;6.36869;,
 -1.96735;-18.07168;8.06522;,
 3.47134;-20.40171;11.13868;,
 9.83844;-16.97667;16.49366;,
 9.80092;-11.85621;20.21792;,
 9.80092;-11.85621;20.21792;,
 9.57509;-6.15513;22.94138;,
 3.02767;-0.49392;20.72872;,
 3.70091;-6.52162;21.25664;,
 -3.07829;4.56837;16.67936;,
 -6.02100;3.46623;10.59577;,
 -6.30186;-5.51468;5.27143;,
 -1.61706;-20.40938;0.39092;,
 -4.10290;-13.92999;-0.18846;,
 9.51569;-21.56334;12.15409;,
 15.82798;-10.76334;19.66930;,
 15.88797;-15.96288;15.98315;,
 15.71184;-5.18175;22.50943;,
 15.82798;-10.76334;19.66930;,
 9.14466;0.32532;21.38117;,
 3.02767;-0.49392;20.72872;,
 -3.07829;4.56837;16.67936;,
 -2.31183;-1.53744;17.68015;,
 2.54177;5.59270;19.18156;,
 -6.36486;10.55065;9.79609;,
 -3.19697;11.07716;15.10607;,
 -8.09304;1.96659;4.34267;,
 -6.41024;-7.41824;-0.94138;,
 -1.61706;-20.40938;0.39092;,
 3.77784;-24.52817;0.72612;,
 3.40004;-22.95689;6.06143;,
 -3.09725;-15.21373;-6.81056;,
 -0.29200;-21.25815;-6.23786;,
 15.80266;-21.12512;12.12662;,
 9.10978;-25.49729;7.27262;,
 21.94753;-14.74583;15.29423;,
 21.96606;-9.77481;19.55647;,
 15.18012;1.21073;21.31301;,
 21.75312;-4.02596;21.65027;,
 21.96606;-9.77481;19.55647;,
 8.55201;6.63288;19.72748;,
 1.86614;11.48660;17.82625;,
 -3.19697;11.07716;15.10607;,
 -7.78709;10.24729;3.46452;,
 -8.32866;-0.88824;-1.66394;,
 -4.89848;-8.56151;-7.21817;,
 5.50762;-25.06613;-5.09812;,
 -0.29200;-21.25815;-6.23786;,
 8.85888;-27.75081;1.13327;,
 3.07885;-20.42431;-12.32975;,
 -3.09725;-15.21373;-6.81056;,
 -0.82947;-15.53535;-13.47188;,
 15.56103;-24.75933;7.03409;,
 22.11164;-20.10848;11.62660;,
 27.91556;-13.41096;14.69660;,
 28.05746;-8.69448;19.45013;,
 14.49507;7.54605;19.71731;,
 21.17355;1.89945;20.63915;,
 28.05746;-8.69448;19.45013;,
 27.51858;-2.12901;20.16742;,
 7.69207;13.20837;18.76613;,
 -3.58974;14.66972;9.38971;,
 -5.13093;15.50419;3.21364;,
 -7.78709;10.24729;3.46452;,
 -6.36486;10.55065;9.79609;,
 -7.62735;10.41312;-3.10603;,
 -8.48555;4.71223;-2.43176;,
 -6.67919;-2.12549;-7.73660;,
 -3.18419;-9.73241;-14.00501;,
 -0.82947;-15.53535;-13.47188;,
 8.22231;-26.62746;-5.08378;,
 7.31633;-24.61961;-11.00984;,
 15.04078;-26.07285;0.77968;,
 7.38606;-19.04802;-17.86975;,
 3.61766;-13.87743;-18.81191;,
 21.91101;-23.33930;6.38669;,
 28.20951;-18.55568;10.80695;,
 33.82221;-7.20692;18.27011;,
 33.79901;-11.77343;13.78859;,
 20.43462;7.99354;19.18942;,
 13.72635;14.22005;18.36144;,
 27.13238;1.43466;19.63580;,
 33.06917;-0.11350;18.37184;,
 33.82221;-7.20692;18.27011;,
 0.82877;16.20311;15.56010;,
 6.27978;19.42240;16.76802;,
 -0.42395;19.53016;3.69330;,
 -0.01371;18.22639;9.82221;,
 -5.13093;15.50419;3.21364;,
 -5.67278;16.29603;-3.32210;,
 -7.14929;10.18935;-9.57782;,
 -7.37651;4.06008;-8.36279;,
 0.82877;16.20311;15.56010;,
 -3.19697;11.07716;15.10607;,
 0.11098;-9.22197;-19.48301;,
 3.61766;-13.87743;-18.81191;,
 14.36085;-26.11577;-5.40419;,
 10.75401;-22.65780;-15.36289;,
 21.22250;-24.41970;0.16719;,
 8.75844;-10.23338;-22.86986;,
 13.92787;-16.05747;-19.59521;,
 7.38606;-19.04802;-17.86975;,
 3.61766;-13.87743;-18.81191;,
 27.93759;-21.40347;5.47325;,
 34.19738;-16.42172;9.80791;,
 39.15414;-6.07637;15.89225;,
 39.48495;-9.57168;12.17995;,
 26.52737;7.66959;18.24083;,
 19.89188;14.54019;17.89680;,
 12.66347;21.03432;16.87725;,
 39.15414;-6.07637;15.89225;,
 38.52509;0.07116;16.80965;,
 5.61183;22.21770;10.78128;,
 6.27978;19.42240;16.76802;,
 -1.06996;20.84756;-2.73696;,
 -5.67278;16.29603;-3.32210;,
 5.38370;23.31288;4.51911;,
 -4.08886;15.81541;-9.69236;,
 -4.27342;8.98094;-14.97386;,
 -5.35730;2.95860;-13.18391;,
 -5.14211;-3.08273;-11.59685;,
 0.11098;-9.22197;-19.48301;,
 4.03770;-4.80137;-22.78640;,
 -3.60476;-4.03977;-15.45707;,
 -2.27682;-5.54048;-18.33443;,
 13.35867;-24.23918;-10.86749;,
 20.60013;-25.02638;-6.09073;,
 13.92787;-16.05747;-19.59521;,
 17.03380;-19.69622;-16.23314;,
 27.16983;-22.56267;-0.57975;,
 16.32852;-8.59779;-22.15849;,
 19.96146;-12.97820;-20.26631;,
 33.93822;-19.17132;4.49242;,
 39.81584;-13.06659;8.46770;,
 26.25600;14.27841;16.71297;,
 32.54047;7.13973;16.84075;,
 19.38278;20.81756;15.62976;,
 12.66347;21.03432;16.87725;,
 11.81817;25.31699;11.19966;,
 39.15414;-6.07637;15.89225;,
 42.52479;-3.54166;10.98096;,
 43.28490;-0.31695;15.05679;,
 38.52509;0.07116;16.80965;,
 38.50913;6.31629;15.35748;,
 4.56690;24.73772;-1.63890;,
 0.30630;20.52020;-8.56778;,
 -4.08886;15.81541;-9.69236;,
 11.82953;26.31081;4.67982;,
 -1.78804;14.82144;-15.74378;,
 -0.91944;6.89448;-19.68622;,
 -2.98988;1.41809;-17.93248;,
 0.00000;-0.85677;-21.38674;,
 4.03770;-4.80137;-22.78640;,
 8.21818;-0.25894;-22.50580;,
 12.42630;-4.31368;-22.94138;,
 19.36996;-23.01081;-11.81578;,
 26.53591;-23.01333;-6.80768;,
 19.96146;-12.97820;-20.26631;,
 23.06016;-17.31973;-17.37980;,
 33.05192;-20.32354;-1.40875;,
 25.36335;-8.98208;-19.30486;,
 21.36126;-4.48555;-20.59598;,
 39.59534;-16.00999;3.33673;,
 32.58773;13.63423;15.17208;,
 26.12593;20.38824;14.00673;,
 19.38278;20.81756;15.62976;,
 18.71044;24.30497;9.66630;,
 44.15571;4.87956;13.55190;,
 43.29845;2.43237;7.69640;,
 44.15571;4.87956;13.55190;,
 43.28490;-0.31695;15.05679;,
 39.08949;12.31667;13.91148;,
 11.22030;27.50499;-1.08804;,
 5.55806;24.65265;-7.57554;,
 2.75729;19.20012;-14.02236;,
 -1.78804;14.82144;-15.74378;,
 18.42302;26.67979;3.48404;,
 2.63021;12.00404;-19.47515;,
 3.73034;3.72132;-22.07024;,
 0.00000;-0.85677;-21.38674;,
 3.73034;3.72132;-22.07024;,
 17.11214;0.04004;-21.95563;,
 12.44562;3.88825;-20.61446;,
 25.43676;-21.25724;-12.85723;,
 32.33429;-20.84478;-7.50056;,
 28.63406;-13.64718;-16.98331;,
 23.06016;-17.31973;-17.37980;,
 38.72947;-17.75990;-2.43344;,
 26.36822;-0.15629;-19.29917;,
 30.78268;-4.75413;-17.98453;,
 42.19147;-7.36674;5.91833;,
 39.81584;-13.06659;8.46770;,
 39.59534;-16.00999;3.33673;,
 42.53195;-10.47339;1.03901;,
 33.00729;20.01754;12.56997;,
 26.12593;20.38824;14.00673;,
 25.24726;23.24727;7.80960;,
 42.01665;-0.84627;2.47982;,
 44.67324;8.65590;3.84452;,
 45.33822;10.09270;11.91538;,
 45.33822;10.09270;11.91538;,
 39.71438;17.73141;10.73715;,
 11.02311;27.75081;-6.79989;,
 17.49529;26.68577;-3.12402;,
 7.37267;24.18840;-11.81091;,
 6.62955;16.51206;-17.91300;,
 2.63021;12.00404;-19.47515;,
 24.34308;24.40652;1.26045;,
 2.63021;12.00404;-19.47515;,
 7.64978;8.10830;-20.42816;,
 -0.91944;6.89448;-19.68622;,
 16.76097;8.22066;-19.04095;,
 21.67771;4.39956;-20.63321;,
 30.95864;-18.10391;-13.13495;,
 37.87185;-18.54612;-8.06951;,
 28.63406;-13.64718;-16.98331;,
 34.16047;-9.68235;-15.94370;,
 42.53195;-10.47339;1.03901;,
 42.45345;-13.30925;-4.19017;,
 31.16165;4.64166;-18.14991;,
 36.17927;-0.14844;-16.90345;,
 41.68533;-4.17779;-2.39906;,
 33.00729;20.01754;12.56997;,
 32.51260;23.76516;6.31005;,
 43.00518;5.41386;-1.44054;,
 46.43330;14.39000;8.75913;,
 39.71438;17.73141;10.73715;,
 39.60853;21.36057;4.44768;,
 16.11834;26.61975;-9.52455;,
 22.96281;24.00918;-5.18466;,
 10.51031;20.87969;-16.49556;,
 6.62955;16.51206;-17.91300;,
 11.64779;12.41632;-18.77168;,
 30.90747;24.15469;-0.54114;,
 20.86648;12.81108;-17.97553;,
 26.01957;9.14604;-19.56803;,
 36.42393;-14.55612;-12.83176;,
 41.31805;-15.68679;-9.02579;,
 36.42393;-14.55612;-12.83176;,
 30.95864;-18.10391;-13.13495;,
 40.28041;-5.84167;-15.12778;,
 42.45345;-13.30925;-4.19017;,
 42.70859;-7.64490;-7.24883;,
 40.99161;5.38047;-16.44496;,
 35.51700;10.02771;-17.39836;,
 41.88543;1.81403;-6.20407;,
 44.76804;10.74730;-5.48838;,
 45.93488;13.62522;-0.00781;,
 36.24905;22.57494;-1.93697;,
 21.43889;23.84294;-11.47647;,
 13.47351;24.00372;-13.77459;,
 29.18510;23.46756;-7.14897;,
 10.51031;20.87969;-16.49556;,
 15.61839;16.70490;-17.23590;,
 24.73895;17.50458;-16.70999;,
 30.27177;14.25876;-18.54089;,
 41.74371;-11.25930;-12.01031;,
 41.31805;-15.68679;-9.02579;,
 41.74371;-11.25930;-12.01031;,
 41.74371;-11.25930;-12.01031;,
 42.96794;-1.94725;-11.03000;,
 38.93600;15.93376;-15.43746;,
 44.30298;11.95982;-14.72589;,
 43.64289;6.97584;-10.28943;,
 45.54771;16.39293;-9.14838;,
 46.16958;18.42237;-2.82921;,
 46.43330;14.39000;8.75913;,
 46.56895;16.76588;6.09135;,
 34.91177;22.09128;-8.77914;,
 19.07898;21.07838;-15.91098;,
 27.51015;22.31880;-13.60437;,
 13.47351;24.00372;-13.77459;,
 19.07898;21.07838;-15.91098;,
 33.29160;19.26389;-14.74965;,
 30.27177;14.25876;-18.54089;,
 24.73895;17.50458;-16.70999;,
 40.28041;-5.84167;-15.12778;,
 41.97975;1.71663;-13.73747;,
 33.29160;19.26389;-14.74965;,
 45.54771;16.39293;-9.14838;,
 44.30298;11.95982;-14.72589;,
 38.93600;15.93376;-15.43746;,
 40.39116;19.84609;-9.64662;,
 40.99161;5.38047;-16.44496;,
 44.30298;11.95982;-14.72589;,
 40.32546;20.86749;-2.61840;,
 46.16958;18.42237;-2.82921;,
 46.70433;19.14160;3.42356;,
 46.70433;19.14160;3.42356;,
 39.48495;-9.57168;12.17995;,
 46.43330;14.39000;8.75913;,
 46.56895;16.76588;6.09135;,
 36.17927;-0.14844;-16.90345;;
 
 235;
 4;0,1,2,3;,
 4;4,5,6,7;,
 4;8,9,10,11;,
 4;12,13,3,2;,
 4;14,0,3,15;,
 4;16,17,5,4;,
 4;5,18,19,6;,
 4;11,10,20,21;,
 4;22,12,2,23;,
 4;24,25,13,12;,
 4;3,13,26,15;,
 4;27,14,15,28;,
 4;29,18,5,17;,
 4;30,19,18,31;,
 4;32,21,20,33;,
 4;34,35,11,21;,
 4;36,37,35,38;,
 4;39,25,24,40;,
 4;41,26,13,25;,
 4;26,42,28,15;,
 4;43,44,45,16;,
 4;27,28,46,47;,
 4;29,48,31,18;,
 4;49,29,17,45;,
 4;30,31,50,51;,
 4;52,34,21,32;,
 4;53,32,33,54;,
 4;34,55,38,35;,
 4;56,57,36,38;,
 4;39,58,41,25;,
 4;41,59,42,26;,
 4;60,46,28,42;,
 4;61,44,43,62;,
 4;63,49,45,44;,
 4;64,62,65,66;,
 4;49,67,48,29;,
 4;48,68,50,31;,
 4;69,70,51,50;,
 4;52,71,55,34;,
 4;52,32,53,72;,
 4;53,54,73,74;,
 4;56,38,55,75;,
 4;76,77,78,79;,
 4;80,81,41,58;,
 4;60,42,59,82;,
 4;60,83,84,46;,
 4;63,44,61,85;,
 4;86,61,62,64;,
 4;63,87,67,49;,
 4;88,64,66,89;,
 4;67,90,68,48;,
 4;68,91,69,50;,
 4;92,70,69,93;,
 4;52,72,94,71;,
 4;75,55,71,95;,
 4;53,74,96,72;,
 4;97,74,73,98;,
 4;99,56,75,100;,
 4;101,77,76,102;,
 4;80,58,103,104;,
 4;105,106,81,80;,
 4;107,102,76,108;,
 4;106,82,59,81;,
 4;109,110,84,83;,
 4;63,85,111,87;,
 4;86,64,88,112;,
 4;87,113,90,67;,
 4;114,115,116,117;,
 4;90,118,91,68;,
 4;93,69,91,119;,
 4;120,92,93,121;,
 4;122,94,72,96;,
 4;94,123,95,71;,
 4;75,95,124,100;,
 4;125,126,97,98;,
 4;127,102,107,128;,
 4;101,129,130,77;,
 4;101,102,127,131;,
 4;132,105,80,104;,
 4;105,133,134,106;,
 4;134,135,82,106;,
 4;114,117,136,137;,
 4;109,83,138,139;,
 4;85,86,140,111;,
 4;87,111,141,113;,
 4;88,142,143,112;,
 4;113,144,118,90;,
 4;114,145,146,115;,
 4;118,147,119,91;,
 4;121,93,119,148;,
 4;122,149,123,94;,
 4;122,96,97,150;,
 4;151,124,95,123;,
 4;127,128,152,153;,
 4;154,155,156,157;,
 4;158,150,97,126;,
 4;101,131,159,129;,
 4;160,161,130,129;,
 4;162,131,127,153;,
 4;163,133,105,132;,
 4;134,133,164,165;,
 4;134,165,138,135;,
 4;109,139,166,167;,
 4;114,137,168,169;,
 4;165,166,139,138;,
 4;111,140,170,141;,
 4;171,144,113,141;,
 4;143,142,172,173;,
 4;112,143,170,140;,
 4;144,174,147,118;,
 4;175,146,145,176;,
 4;177,148,119,147;,
 4;122,150,178,149;,
 4;151,123,149,179;,
 4;180,181,153,152;,
 4;182,156,155,183;,
 4;184,158,126,185;,
 4;178,150,158,186;,
 4;187,159,131,162;,
 4;160,129,159,188;,
 4;189,190,161,160;,
 4;162,153,181,191;,
 4;192,164,133,163;,
 4;164,193,166,165;,
 4;168,137,194,195;,
 4;196,169,168,197;,
 4;171,141,170,198;,
 4;171,199,174,144;,
 4;200,201,146,175;,
 4;198,170,143,173;,
 4;177,147,174,202;,
 4;196,176,145,169;,
 4;175,176,203,204;,
 4;205,206,207,208;,
 4;178,209,179,149;,
 4;180,210,211,181;,
 4;212,183,155,205;,
 4;182,183,213,214;,
 4;184,215,186,158;,
 4;178,186,216,209;,
 4;217,188,159,187;,
 4;187,162,191,218;,
 4;219,189,160,188;,
 4;189,220,221,190;,
 4;181,211,222,191;,
 4;223,224,195,225;,
 4;168,195,224,197;,
 4;196,197,226,227;,
 4;171,198,228,199;,
 4;229,202,174,199;,
 4;230,228,198,173;,
 4;200,175,204,231;,
 4;232,177,202,233;,
 4;196,227,203,176;,
 4;203,234,235,204;,
 4;236,212,205,208;,
 4;211,210,237,238;,
 4;212,239,213,183;,
 4;215,240,216,186;,
 4;238,237,241,242;,
 4;217,187,218,243;,
 4;244,218,191,222;,
 4;219,245,220,189;,
 4;223,246,247,224;,
 4;222,211,238,248;,
 4;247,226,197,224;,
 4;249,250,227,226;,
 4;228,251,229,199;,
 4;252,233,202,229;,
 4;200,231,253,254;,
 4;231,204,235,255;,
 4;236,208,256,257;,
 4;227,250,234,203;,
 4;258,235,234,259;,
 4;236,260,239,212;,
 4;239,261,262,213;,
 4;238,242,263,248;,
 4;264,243,218,244;,
 4;217,243,265,219;,
 4;244,222,248,266;,
 4;267,268,247,246;,
 4;249,226,247,268;,
 4;249,269,270,250;,
 4;252,229,251,271;,
 4;257,256,272,273;,
 4;231,255,274,253;,
 4;236,257,275,260;,
 4;270,259,234,250;,
 4;258,259,276,277;,
 4;239,260,278,261;,
 4;279,280,262,261;,
 4;281,213,262,282;,
 4;283,266,248,263;,
 4;264,284,265,243;,
 4;264,244,266,285;,
 4;286,287,268,267;,
 4;249,268,287,269;,
 4;285,288,289,290;,
 4;275,257,273,291;,
 4;275,292,278,260;,
 4;276,259,270,293;,
 4;294,295,296,297;,
 4;298,299,278,292;,
 4;279,261,278,299;,
 4;294,297,300,301;,
 4;302,282,262,280;,
 4;303,301,300,242;,
 4;285,266,283,288;,
 4;283,263,300,297;,
 4;264,285,290,284;,
 4;283,297,296,288;,
 3;16,45,17;,
 3;79,108,76;,
 3;57,56,99;,
 3;41,81,59;,
 3;82,135,60;,
 3;60,135,83;,
 3;135,138,83;,
 3;61,86,85;,
 3;74,97,96;,
 3;86,112,140;,
 3;205,155,206;,
 3;206,155,304;,
 3;155,154,304;,
 3;114,169,145;,
 3;213,281,214;,
 3;188,217,219;,
 3;242,241,303;,
 3;241,305,303;,
 3;305,306,303;,
 3;219,265,245;,
 3;307,298,291;,
 3;298,292,291;,
 3;292,275,291;,
 3;242,300,263;;
 
 MeshMaterialList {
  1;
  235;
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
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
    "stonegoleme.png";
   }
  }
 }
 MeshNormals {
  232;
  -0.728299;-0.465523;0.502861;,
  -0.618797;-0.415238;0.666833;,
  -0.729413;-0.205624;0.652438;,
  -0.913552;-0.230223;0.335292;,
  -0.338063;-0.635998;0.693700;,
  -0.318311;-0.484293;0.814947;,
  -0.356949;-0.166048;0.919247;,
  -0.740616;-0.024071;0.671498;,
  -0.925251;-0.147919;0.349328;,
  -0.745388;-0.589817;0.310665;,
  -0.939709;-0.291145;0.179392;,
  -0.410561;-0.734139;0.540814;,
  -0.016251;-0.634099;0.773081;,
  -0.009959;-0.506673;0.862081;,
  -0.066725;-0.130242;0.989234;,
  -0.335702;0.127799;0.933259;,
  -0.714408;0.075498;0.695645;,
  -0.928716;-0.040217;0.368604;,
  -0.951590;-0.232977;0.200493;,
  -0.793980;-0.607129;0.031474;,
  -0.940793;-0.338685;-0.014136;,
  -0.088906;-0.749951;0.655492;,
  0.155731;-0.504319;0.849359;,
  0.155391;-0.599007;0.785522;,
  0.102982;-0.113706;0.988163;,
  -0.088945;0.209288;0.973800;,
  -0.306526;0.180637;0.934565;,
  -0.890875;0.290848;0.348926;,
  -0.696082;0.354801;0.624168;,
  -0.985689;-0.061212;0.157069;,
  -0.957184;-0.288417;-0.024774;,
  -0.551764;-0.830008;0.081508;,
  -0.501224;-0.792858;0.346627;,
  -0.894899;-0.394399;-0.208817;,
  -0.726984;-0.652812;-0.212912;,
  0.146995;-0.716465;0.681961;,
  -0.146142;-0.888001;0.436001;,
  0.186953;-0.604002;0.774745;,
  0.168122;-0.481069;0.860411;,
  0.036802;0.221387;0.974491;,
  0.154410;-0.063885;0.985939;,
  -0.078903;0.205313;0.975511;,
  -0.347631;0.236186;0.907397;,
  -0.954809;0.259292;0.145285;,
  -0.984975;-0.163116;-0.056722;,
  -0.936217;-0.281165;-0.210819;,
  -0.534437;-0.828460;-0.167426;,
  -0.172203;-0.980896;0.090490;,
  -0.590619;-0.652895;-0.474234;,
  -0.750289;-0.476940;-0.457816;,
  0.187634;-0.898596;0.396635;,
  0.234670;-0.711120;0.662750;,
  0.253933;-0.625592;0.737667;,
  0.242135;-0.420310;0.874477;,
  0.029142;0.216746;0.975793;,
  0.130845;0.210694;0.968756;,
  0.220235;0.023938;0.975153;,
  -0.119850;0.224282;0.967126;,
  -0.747284;0.591412;0.302982;,
  -0.790478;0.587404;0.173498;,
  -0.969234;0.239746;-0.055753;,
  -0.997668;0.013983;-0.066804;,
  -0.944998;-0.197822;-0.260473;,
  -0.887294;-0.283731;-0.363601;,
  -0.203133;-0.959299;-0.196168;,
  -0.282003;-0.881786;-0.378058;,
  0.209240;-0.974027;0.086539;,
  -0.282749;-0.598221;-0.749790;,
  -0.466596;-0.470457;-0.748972;,
  0.274524;-0.903458;0.329242;,
  0.309679;-0.719154;0.622027;,
  0.357274;-0.369436;0.857830;,
  0.374364;-0.624597;0.685368;,
  0.121709;0.226207;0.966446;,
  0.041235;0.231019;0.972075;,
  0.212352;0.202123;0.956061;,
  0.276303;0.108920;0.954879;,
  -0.543545;0.516257;0.661844;,
  -0.324887;0.570162;0.754562;,
  -0.624448;0.753077;0.207218;,
  -0.634434;0.716683;0.289584;,
  -0.823602;0.565949;-0.037176;,
  -0.930512;0.209228;-0.300618;,
  -0.958543;-0.040950;-0.281990;,
  -0.642709;-0.324600;-0.693945;,
  0.146744;-0.970365;-0.191982;,
  -0.018268;-0.792931;-0.609038;,
  0.275383;-0.956872;0.092522;,
  -0.073808;-0.253270;-0.964576;,
  0.039600;-0.491435;-0.870014;,
  0.344444;-0.892970;0.289764;,
  0.423805;-0.706020;0.567384;,
  0.602129;-0.368007;0.708528;,
  0.670264;-0.499997;0.548406;,
  0.210064;0.229109;0.950464;,
  0.143877;0.272275;0.951402;,
  -0.010632;0.591342;0.806351;,
  0.418902;0.008007;0.907996;,
  -0.477638;0.820844;0.313173;,
  -0.637784;0.770051;0.015928;,
  -0.496721;0.843331;0.205087;,
  -0.771795;0.554981;-0.310368;,
  -0.815978;0.185258;-0.547594;,
  -0.904194;-0.046261;-0.424610;,
  -0.933101;-0.175653;-0.313798;,
  -0.283822;-0.111483;-0.952374;,
  -0.896938;-0.144414;-0.417907;,
  -0.778257;-0.172125;-0.603895;,
  0.114225;-0.908245;-0.402546;,
  0.229347;-0.960732;-0.156184;,
  0.139183;-0.675361;-0.724234;,
  0.338890;-0.936865;0.086240;,
  0.197146;-0.132478;-0.971382;,
  0.219092;-0.328491;-0.918745;,
  0.437891;-0.856429;0.273460;,
  0.776576;-0.495440;0.389190;,
  0.216976;0.301609;0.928414;,
  0.251100;0.224861;0.941481;,
  0.193494;0.632463;0.750034;,
  -0.123889;0.915302;0.383241;,
  0.920603;-0.287330;0.264444;,
  0.783311;-0.127608;0.608392;,
  0.303106;0.212035;0.929068;,
  -0.502980;0.860551;0.080399;,
  -0.604780;0.745137;-0.281092;,
  -0.178307;0.964894;0.192837;,
  -0.610479;0.509944;-0.606029;,
  -0.564650;0.203032;-0.799968;,
  -0.816196;0.003642;-0.577764;,
  -0.557742;-0.014415;-0.829890;,
  0.012176;0.161582;-0.986784;,
  0.100375;0.059087;-0.993194;,
  0.175146;-0.857854;-0.483125;,
  0.324923;-0.930713;-0.167922;,
  0.236042;-0.546349;-0.803608;,
  0.399368;-0.912449;0.089118;,
  0.306955;-0.150153;-0.939805;,
  0.273203;-0.032443;-0.961409;,
  0.722363;-0.651075;0.233008;,
  0.259098;0.309628;0.914877;,
  0.198279;0.669774;0.715604;,
  0.204945;0.908306;0.364662;,
  0.977634;-0.203871;-0.051653;,
  0.978747;-0.190098;-0.076924;,
  0.336793;0.318434;0.886099;,
  -0.161662;0.983526;0.080890;,
  -0.507494;0.836325;-0.207388;,
  -0.467027;0.673288;-0.573209;,
  0.213432;0.969210;0.122797;,
  -0.257175;0.382722;-0.887347;,
  -0.175038;0.189012;-0.966249;,
  0.143652;0.151428;-0.977974;,
  0.083756;0.270191;-0.959157;,
  0.277664;-0.783939;-0.555286;,
  0.388707;-0.891859;-0.231288;,
  0.352635;-0.369635;-0.859662;,
  0.627722;-0.771773;0.101642;,
  0.258773;-0.022185;-0.965683;,
  0.279793;-0.099158;-0.954926;,
  0.982038;-0.176360;0.067067;,
  0.977590;-0.188437;0.093858;,
  0.270505;0.653178;0.707238;,
  0.160219;0.936551;0.311772;,
  0.991639;-0.105449;-0.074385;,
  0.963873;-0.259397;-0.060517;,
  0.966978;-0.252266;-0.036258;,
  0.401748;0.641089;0.653914;,
  -0.215991;0.952652;-0.214013;,
  0.254551;0.966601;-0.029759;,
  -0.340132;0.783415;-0.520164;,
  -0.140777;0.451633;-0.881027;,
  0.187361;0.981517;0.038982;,
  0.059529;0.264409;-0.962572;,
  0.029370;0.268078;-0.962950;,
  0.109676;0.152974;-0.982125;,
  0.377406;-0.656278;-0.653347;,
  0.514667;-0.797985;-0.313589;,
  0.343006;-0.288698;-0.893868;,
  0.939429;-0.341323;0.031172;,
  0.222642;-0.025040;-0.974579;,
  0.231315;-0.086266;-0.969047;,
  0.999425;0.017040;0.029304;,
  0.205544;0.942239;0.264457;,
  0.965529;-0.254501;-0.054612;,
  0.187886;0.655442;0.731501;,
  0.359797;0.917982;0.166900;,
  0.175233;0.931404;-0.319030;,
  0.237874;0.965267;-0.108054;,
  -0.107899;0.533658;-0.838789;,
  0.087002;0.250163;-0.964287;,
  0.143723;0.989190;-0.029110;,
  -0.019006;0.267721;-0.963309;,
  0.075115;0.144750;-0.986613;,
  0.386912;-0.542264;-0.745821;,
  0.790892;-0.541112;-0.285811;,
  0.654330;-0.177561;-0.735067;,
  0.997974;-0.024288;-0.058811;,
  0.551432;-0.075808;-0.830768;,
  0.232384;0.105615;-0.966873;,
  0.994452;-0.099354;0.034566;,
  0.968330;-0.243677;-0.054396;,
  0.977936;-0.197644;-0.067662;,
  0.318106;0.945153;-0.074125;,
  0.217247;0.884351;-0.413191;,
  -0.010080;0.731626;-0.681632;,
  0.159930;0.970855;-0.178501;,
  0.060328;0.295492;-0.953439;,
  0.029025;0.453549;-0.890759;,
  0.119996;0.298745;-0.946759;,
  0.757019;-0.340202;-0.557840;,
  0.986907;-0.038859;-0.156537;,
  0.356986;0.501116;-0.788318;,
  0.801356;0.113500;-0.587321;,
  0.977744;-0.185124;-0.098718;,
  0.982133;-0.168751;-0.083288;,
  0.989282;-0.124360;-0.076526;,
  0.985909;-0.157437;-0.056535;,
  0.293768;0.910093;-0.292287;,
  0.099693;0.557099;-0.824440;,
  0.148458;0.825120;-0.545103;,
  0.242195;0.676814;-0.695173;,
  0.938861;-0.115623;-0.324300;,
  0.426113;0.822451;-0.376831;,
  0.388879;0.913841;-0.116907;,
  0.993057;-0.100802;-0.060632;,
  0.350608;0.203652;0.914112;,
  0.394271;0.322758;0.860452;,
  0.969586;-0.241134;-0.041908;,
  0.501884;0.761144;-0.410819;,
  0.404938;0.901279;-0.154016;,
  0.208985;0.871915;0.442821;,
  -0.412781;0.690514;0.593971;;
  235;
  4;0,1,2,3;,
  4;0,4,5,1;,
  4;2,1,5,6;,
  4;7,8,3,2;,
  4;9,0,3,10;,
  4;9,11,4,0;,
  4;4,12,13,5;,
  4;6,5,13,14;,
  4;15,7,2,6;,
  4;16,17,8,7;,
  4;3,8,18,10;,
  4;19,9,10,20;,
  4;21,12,4,11;,
  4;22,13,12,23;,
  4;24,14,13,22;,
  4;25,15,6,14;,
  4;16,7,15,26;,
  4;27,17,16,28;,
  4;29,18,8,17;,
  4;18,30,20,10;,
  4;19,31,32,9;,
  4;19,20,33,34;,
  4;21,35,23,12;,
  4;36,21,11,32;,
  4;22,23,37,38;,
  4;39,25,14,24;,
  4;40,24,22,38;,
  4;25,41,26,15;,
  4;42,28,16,26;,
  4;27,43,29,17;,
  4;29,44,30,18;,
  4;45,33,20,30;,
  4;46,31,19,34;,
  4;47,36,32,31;,
  4;48,34,33,49;,
  4;36,50,35,21;,
  4;35,51,37,23;,
  4;52,53,38,37;,
  4;39,54,41,25;,
  4;39,24,40,55;,
  4;40,38,53,56;,
  4;42,26,41,57;,
  4;58,59,43,27;,
  4;60,61,29,43;,
  4;45,30,44,62;,
  4;45,63,49,33;,
  4;47,31,46,64;,
  4;65,46,34,48;,
  4;47,66,50,36;,
  4;67,48,49,68;,
  4;50,69,51,35;,
  4;51,70,52,37;,
  4;71,53,52,72;,
  4;39,55,73,54;,
  4;57,41,54,74;,
  4;40,56,75,55;,
  4;76,56,53,71;,
  4;77,42,57,78;,
  4;79,59,58,80;,
  4;60,43,59,81;,
  4;82,83,61,60;,
  4;77,80,58,28;,
  4;83,62,44,61;,
  4;84,68,49,63;,
  4;47,64,85,66;,
  4;65,48,67,86;,
  4;66,87,69,50;,
  4;88,89,67,68;,
  4;69,90,70,51;,
  4;72,52,70,91;,
  4;92,71,72,93;,
  4;94,73,55,75;,
  4;73,95,74,54;,
  4;57,74,96,78;,
  4;92,97,76,71;,
  4;98,80,77,78;,
  4;79,99,81,59;,
  4;79,80,98,100;,
  4;101,82,60,81;,
  4;82,102,103,83;,
  4;103,104,62,83;,
  4;88,68,84,105;,
  4;84,63,106,107;,
  4;64,65,108,85;,
  4;66,85,109,87;,
  4;67,89,110,86;,
  4;87,111,90,69;,
  4;88,112,113,89;,
  4;90,114,91,70;,
  4;93,72,91,115;,
  4;94,116,95,73;,
  4;94,75,76,117;,
  4;118,96,74,95;,
  4;98,78,96,119;,
  4;92,120,121,97;,
  4;122,117,76,97;,
  4;79,100,123,99;,
  4;124,101,81,99;,
  4;125,100,98,119;,
  4;126,102,82,101;,
  4;103,102,127,128;,
  4;103,128,106,104;,
  4;84,107,129,105;,
  4;88,105,130,131;,
  4;128,129,107,106;,
  4;85,108,132,109;,
  4;133,111,87,109;,
  4;110,89,113,134;,
  4;86,110,132,108;,
  4;111,135,114,90;,
  4;136,113,112,137;,
  4;138,115,91,114;,
  4;94,117,139,116;,
  4;118,95,116,140;,
  4;118,141,119,96;,
  4;142,121,120,143;,
  4;225,122,97,121;,
  4;139,117,122,144;,
  4;145,123,100,125;,
  4;124,99,123,146;,
  4;147,126,101,124;,
  4;125,119,141,148;,
  4;149,127,102,126;,
  4;127,150,129,128;,
  4;130,105,129,150;,
  4;151,131,130,152;,
  4;133,109,132,153;,
  4;133,154,135,111;,
  4;155,134,113,136;,
  4;153,132,110,134;,
  4;138,114,135,156;,
  4;151,137,112,131;,
  4;136,137,157,158;,
  4;159,115,138,160;,
  4;139,161,140,116;,
  4;118,140,162,141;,
  4;163,143,120,159;,
  4;142,143,164,165;,
  4;225,226,144,122;,
  4;139,144,166,161;,
  4;167,146,123,145;,
  4;145,125,148,168;,
  4;169,147,124,146;,
  4;147,170,149,126;,
  4;141,162,171,148;,
  4;149,172,150,127;,
  4;130,150,172,152;,
  4;151,152,173,174;,
  4;133,153,175,154;,
  4;176,156,135,154;,
  4;155,175,153,134;,
  4;155,136,158,177;,
  4;160,138,156,178;,
  4;151,174,157,137;,
  4;157,179,180,158;,
  4;181,163,159,160;,
  4;162,140,161,182;,
  4;163,183,164,143;,
  4;226,184,166,144;,
  4;182,161,166,185;,
  4;167,145,168,186;,
  4;187,168,148,171;,
  4;169,188,170,147;,
  4;149,170,189,172;,
  4;171,162,182,190;,
  4;189,173,152,172;,
  4;191,192,174,173;,
  4;175,193,176,154;,
  4;194,178,156,176;,
  4;155,177,193,175;,
  4;177,158,180,195;,
  4;181,160,178,196;,
  4;174,192,179,157;,
  4;197,180,179,198;,
  4;181,199,183,163;,
  4;183,200,201,164;,
  4;182,185,202,190;,
  4;203,186,168,187;,
  4;167,186,204,169;,
  4;187,171,190,205;,
  4;188,206,189,170;,
  4;191,173,189,206;,
  4;191,207,208,192;,
  4;194,176,193,209;,
  4;196,178,194,209;,
  4;177,195,209,193;,
  4;181,196,210,199;,
  4;208,198,179,192;,
  4;197,198,211,212;,
  4;183,199,213,200;,
  4;214,215,201,200;,
  4;227,164,201,216;,
  4;217,205,190,202;,
  4;203,218,204,186;,
  4;203,187,205,219;,
  4;204,218,206,188;,
  4;191,206,218,207;,
  4;219,220,208,207;,
  4;210,196,209,195;,
  4;210,221,213,199;,
  4;211,198,208,220;,
  4;228,212,211,222;,
  4;197,212,213,221;,
  4;214,200,213,212;,
  4;228,222,223,229;,
  4;224,216,201,215;,
  4;230,229,223,185;,
  4;219,205,217,220;,
  4;217,202,223,222;,
  4;203,219,207,218;,
  4;217,222,211,220;,
  3;9,32,11;,
  3;27,28,58;,
  3;28,42,77;,
  3;29,61,44;,
  3;62,104,45;,
  3;45,104,63;,
  3;104,106,63;,
  3;46,65,64;,
  3;56,76,75;,
  3;65,86,108;,
  3;159,120,115;,
  3;115,120,93;,
  3;120,92,93;,
  3;88,131,112;,
  3;164,227,165;,
  3;146,167,169;,
  3;185,166,230;,
  3;166,184,230;,
  3;184,231,230;,
  3;169,204,188;,
  3;180,197,195;,
  3;197,221,195;,
  3;221,210,195;,
  3;185,223,202;;
 }
 MeshTextureCoords {
  308;
  0.765740;0.630420;,
  0.758300;0.621920;,
  0.739360;0.615310;,
  0.747090;0.636500;,
  0.903320;0.798180;,
  0.909810;0.817500;,
  0.922620;0.819000;,
  0.911810;0.799640;,
  0.748260;0.960400;,
  0.767200;0.957920;,
  0.765950;0.938550;,
  0.744980;0.940640;,
  0.716780;0.616420;,
  0.723420;0.640400;,
  0.780840;0.653670;,
  0.757320;0.660240;,
  0.880070;0.794960;,
  0.891970;0.816030;,
  0.912720;0.840700;,
  0.927150;0.840550;,
  0.765650;0.917010;,
  0.743560;0.917880;,
  0.712730;0.604600;,
  0.736090;0.602560;,
  0.693120;0.620290;,
  0.697390;0.643860;,
  0.732190;0.664490;,
  0.789890;0.683400;,
  0.764790;0.685650;,
  0.895910;0.839450;,
  0.925030;0.863900;,
  0.910740;0.864140;,
  0.739790;0.894100;,
  0.761420;0.893650;,
  0.718460;0.919550;,
  0.721630;0.943250;,
  0.702020;0.966900;,
  0.725670;0.963940;,
  0.698050;0.945130;,
  0.669940;0.646960;,
  0.667900;0.626390;,
  0.703200;0.668090;,
  0.739560;0.688570;,
  0.850330;0.796310;,
  0.851630;0.817210;,
  0.872300;0.815750;,
  0.769770;0.711300;,
  0.793180;0.709080;,
  0.895800;0.863800;,
  0.877000;0.837870;,
  0.908070;0.887610;,
  0.924590;0.887680;,
  0.715030;0.896160;,
  0.735310;0.870700;,
  0.757590;0.869870;,
  0.694020;0.921850;,
  0.675210;0.947750;,
  0.676800;0.967370;,
  0.671120;0.671490;,
  0.714260;0.691360;,
  0.743990;0.712880;,
  0.829070;0.823920;,
  0.824650;0.801450;,
  0.853210;0.836900;,
  0.801050;0.814510;,
  0.822430;0.790580;,
  0.796620;0.799360;,
  0.876070;0.862870;,
  0.893860;0.888250;,
  0.905760;0.910740;,
  0.924180;0.911280;,
  0.690480;0.898820;,
  0.712360;0.872950;,
  0.753400;0.846270;,
  0.727960;0.848360;,
  0.668540;0.925180;,
  0.523130;0.772500;,
  0.547060;0.766530;,
  0.546090;0.756240;,
  0.521560;0.761750;,
  0.670480;0.696950;,
  0.692560;0.694340;,
  0.719050;0.714890;,
  0.748530;0.739180;,
  0.771010;0.737110;,
  0.829120;0.834430;,
  0.806160;0.830920;,
  0.851840;0.860850;,
  0.779580;0.831190;,
  0.775930;0.816600;,
  0.873560;0.887470;,
  0.890690;0.911870;,
  0.919610;0.933620;,
  0.902240;0.933530;,
  0.688750;0.875810;,
  0.664620;0.901800;,
  0.714160;0.849850;,
  0.720160;0.826850;,
  0.747640;0.823940;,
  0.656940;0.951770;,
  0.644470;0.930650;,
  0.545210;0.784770;,
  0.521460;0.786360;,
  0.650750;0.672470;,
  0.647680;0.697790;,
  0.671340;0.722030;,
  0.695090;0.717320;,
  0.499230;0.789620;,
  0.500990;0.774030;,
  0.746550;0.760400;,
  0.764590;0.757800;,
  0.827880;0.858220;,
  0.789300;0.844240;,
  0.849470;0.884800;,
  0.928720;0.650990;,
  0.951290;0.671010;,
  0.962870;0.645670;,
  0.942840;0.631070;,
  0.870020;0.910820;,
  0.886820;0.935070;,
  0.910390;0.954280;,
  0.896010;0.955560;,
  0.690000;0.852200;,
  0.663380;0.877910;,
  0.638220;0.905920;,
  0.743260;0.803280;,
  0.719440;0.805720;,
  0.517740;0.808160;,
  0.494550;0.810740;,
  0.570120;0.782270;,
  0.572390;0.764430;,
  0.542010;0.807270;,
  0.649550;0.722470;,
  0.676020;0.742930;,
  0.699360;0.736000;,
  0.722760;0.729850;,
  0.924800;0.617480;,
  0.907670;0.632700;,
  0.726470;0.744800;,
  0.732290;0.755950;,
  0.806710;0.854340;,
  0.825220;0.882390;,
  0.772900;0.856540;,
  0.785920;0.868570;,
  0.846570;0.907850;,
  0.922380;0.680320;,
  0.939350;0.694390;,
  0.866220;0.934070;,
  0.881620;0.956840;,
  0.664390;0.853250;,
  0.692050;0.828900;,
  0.639060;0.879880;,
  0.494130;0.835480;,
  0.516120;0.832200;,
  0.517730;0.715880;,
  0.536760;0.706060;,
  0.520970;0.693560;,
  0.514180;0.692060;,
  0.695240;0.805780;,
  0.565860;0.804110;,
  0.592710;0.787600;,
  0.597070;0.770570;,
  0.541380;0.832240;,
  0.653400;0.745910;,
  0.684110;0.761190;,
  0.705330;0.754390;,
  0.714140;0.767780;,
  0.729420;0.773200;,
  0.890080;0.648890;,
  0.905790;0.665200;,
  0.803040;0.877630;,
  0.822440;0.905390;,
  0.770300;0.879920;,
  0.781480;0.891920;,
  0.843360;0.930630;,
  0.923870;0.715320;,
  0.906450;0.699810;,
  0.861750;0.955990;,
  0.666890;0.828720;,
  0.640720;0.853750;,
  0.498960;0.861510;,
  0.522060;0.858910;,
  0.526800;0.673430;,
  0.549490;0.682910;,
  0.700810;0.783900;,
  0.720940;0.787280;,
  0.672000;0.803530;,
  0.563730;0.829890;,
  0.588860;0.807950;,
  0.613840;0.797100;,
  0.620510;0.779480;,
  0.546020;0.857790;,
  0.664310;0.760370;,
  0.696400;0.770430;,
  0.892390;0.617050;,
  0.874650;0.631510;,
  0.888920;0.683350;,
  0.874010;0.665270;,
  0.799000;0.901130;,
  0.819760;0.927860;,
  0.941950;0.727990;,
  0.956180;0.706400;,
  0.839390;0.952630;,
  0.889680;0.719210;,
  0.907490;0.736320;,
  0.556380;0.720880;,
  0.546500;0.742960;,
  0.566380;0.754360;,
  0.575280;0.732910;,
  0.642160;0.827100;,
  0.505250;0.887640;,
  0.529260;0.884230;,
  0.569700;0.695610;,
  0.564410;0.658800;,
  0.533140;0.653230;,
  0.680610;0.779320;,
  0.651020;0.801110;,
  0.585860;0.829120;,
  0.571620;0.854200;,
  0.605270;0.814980;,
  0.628920;0.812100;,
  0.634970;0.796600;,
  0.554630;0.880730;,
  0.842560;0.627240;,
  0.857660;0.646690;,
  0.862360;0.613490;,
  0.857220;0.681990;,
  0.872030;0.701040;,
  0.797930;0.922520;,
  0.817560;0.949310;,
  0.783020;0.913520;,
  0.926590;0.749400;,
  0.852840;0.967370;,
  0.832580;0.967060;,
  0.871090;0.737780;,
  0.889650;0.757230;,
  0.588600;0.708520;,
  0.510810;0.914300;,
  0.535070;0.912380;,
  0.584890;0.671360;,
  0.663960;0.775080;,
  0.517910;0.940280;,
  0.542280;0.939870;,
  0.596420;0.848860;,
  0.579600;0.875380;,
  0.623430;0.827130;,
  0.825100;0.642740;,
  0.840960;0.662180;,
  0.561610;0.906160;,
  0.839440;0.697900;,
  0.853640;0.717860;,
  0.799100;0.943700;,
  0.813850;0.962660;,
  0.945470;0.758170;,
  0.959210;0.737000;,
  0.911700;0.773110;,
  0.595540;0.743900;,
  0.607390;0.721950;,
  0.868220;0.775870;,
  0.850220;0.754660;,
  0.603340;0.685310;,
  0.600570;0.650690;,
  0.579330;0.639540;,
  0.567020;0.926860;,
  0.603980;0.869480;,
  0.612880;0.838620;,
  0.587210;0.899490;,
  0.808180;0.657770;,
  0.824350;0.677560;,
  0.821250;0.712900;,
  0.833830;0.734340;,
  0.802290;0.964310;,
  0.614270;0.753110;,
  0.625840;0.735960;,
  0.932690;0.778780;,
  0.622040;0.699880;,
  0.827340;0.767910;,
  0.842730;0.788700;,
  0.619170;0.665310;,
  0.614750;0.628820;,
  0.590270;0.620960;,
  0.545370;0.636580;,
  0.555700;0.627380;,
  0.593530;0.921680;,
  0.621160;0.860330;,
  0.612220;0.893000;,
  0.796070;0.669250;,
  0.807400;0.690970;,
  0.616660;0.915400;,
  0.631350;0.903700;,
  0.624260;0.882260;,
  0.637920;0.714970;,
  0.632530;0.685680;,
  0.814440;0.746040;,
  0.594960;0.962880;,
  0.616570;0.958060;,
  0.619320;0.937270;,
  0.596890;0.942910;,
  0.643020;0.671490;,
  0.636360;0.646000;,
  0.569660;0.942650;,
  0.570480;0.965290;,
  0.566040;0.618170;,
  0.546250;0.967370;,
  0.532110;0.729420;,
  0.525580;0.966320;,
  0.535910;0.966840;,
  0.644800;0.692910;;
 }
}
