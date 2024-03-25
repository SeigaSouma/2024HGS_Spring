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
 280;
 423.68004;1484.47365;-64.18560;,
 633.25445;1448.64641;-0.08320;,
 -75.28960;1050.34250;-104.66560;,
 164.85761;-29.56160;-0.00000;,
 -33.34400;4.32000;0.00000;,
 509.95841;1989.15218;0.00000;,
 -93.28000;1498.89924;-131.11040;,
 719.52643;1953.32483;0.00000;,
 1072.73595;2020.13441;-0.05120;,
 568.23682;2107.44984;-512.05123;,
 546.55362;1980.61448;-0.05120;,
 63.22561;2191.78890;-0.05120;,
 567.46241;2102.91234;511.94879;,
 841.44640;465.68961;0.00000;,
 866.18878;413.90079;-467.55201;,
 404.22401;193.15199;-261.14561;,
 373.01763;258.45760;0.00000;,
 -57.74721;-27.59040;-54.74560;,
 1342.40002;753.28004;512.00001;,
 1344.19211;601.10079;0.00000;,
 804.98566;541.99039;512.00001;,
 404.22401;193.15199;295.66082;,
 1976.32015;736.42877;54.30400;,
 1348.19846;707.79527;-635.82081;,
 -57.74721;-27.59040;73.84960;,
 332.28802;403.26400;-648.46720;,
 -18.26560;358.41922;-852.17921;,
 -41.62560;167.26400;-414.64962;,
 147.30880;223.80801;-287.46883;,
 -64.99201;-23.89760;22.88640;,
 924.69757;652.30719;-832.35197;,
 530.82882;520.52476;-1035.91671;,
 712.47359;469.33765;-418.18238;,
 387.48802;167.26400;-194.75840;,
 822.31046;637.70880;-1501.63205;,
 42.40640;612.91529;-1290.09924;,
 34.11200;-23.89760;73.66400;,
 362.11199;396.62078;618.42560;,
 716.39039;352.51199;435.39840;,
 365.88802;164.50561;184.70401;,
 160.52481;220.12161;274.15039;,
 15.38560;-23.50080;-65.99680;,
 201.40160;641.55514;1206.94406;,
 578.47042;511.94239;987.91681;,
 -29.87520;461.60640;811.96168;,
 -43.34080;164.50561;424.32003;,
 1047.49445;602.81602;717.24156;,
 810.59196;627.20001;1475.87844;,
 -79.12960;-23.50080;-10.65600;,
 -485.66402;585.29923;588.60172;,
 -140.77440;545.65763;907.00158;,
 -32.21120;255.36641;450.16964;,
 -211.14241;310.89920;254.37439;,
 76.34560;-34.92480;-6.65600;,
 -1173.03039;935.33439;617.05602;,
 -787.25128;793.77281;958.29123;,
 -855.96163;646.68805;230.25921;,
 -466.18883;245.96482;101.44000;,
 -285.66402;910.60480;1346.13752;,
 -1211.57765;1020.44162;1393.52317;,
 -23.87840;-37.10080;-87.20000;,
 -687.66090;530.33604;-37.36960;,
 -790.98243;419.31519;360.45442;,
 -376.05762;189.34401;205.88162;,
 -298.79041;280.87681;-7.75040;,
 38.86080;-40.62720;51.30880;,
 -1013.19679;930.70724;-506.86720;,
 -1115.13605;721.49127;-83.90401;,
 -563.98082;667.80797;-468.39683;,
 -286.16961;271.49441;-282.41280;,
 -1647.93616;939.11046;-195.96161;,
 -1208.90890;722.16324;491.20640;,
 59.62241;-21.65760;-61.45920;,
 -409.61924;597.74723;-632.30079;,
 -821.45284;545.51041;-409.67681;,
 -419.60323;254.09280;-168.14721;,
 -177.48480;316.28802;-272.77439;,
 -17.74720;-37.33120;73.37600;,
 -220.53760;969.55519;-1281.77922;,
 -665.62564;814.02242;-1030.76476;,
 47.87840;672.74234;-865.46554;,
 50.35520;260.32000;-466.70718;,
 -944.44796;1052.10246;-1565.95852;,
 -1195.98088;912.80001;-677.72809;,
 90.79040;-35.89120;4.42880;,
 -160.05761;1028.00002;193.51680;,
 -23.60320;1529.51692;-217.51040;,
 -7.78880;-0.51200;32.70400;,
 38.83520;-5.58080;-162.82880;,
 88.04481;1524.53772;-409.40162;,
 38.83520;2041.72796;-215.90401;,
 -207.41761;1469.15207;266.74561;,
 88.12800;2036.37132;-422.64962;,
 165.44641;2134.98890;-760.17281;,
 -451.31519;2134.55374;-380.69764;,
 46.73280;2039.76312;-259.48802;,
 -71.97440;2139.59046;236.14080;,
 544.78082;2166.73929;-144.03201;,
 -1.91360;996.85763;355.12962;,
 -327.16802;1507.59690;85.99680;,
 24.12160;-1.21600;23.39200;,
 -119.39840;-1.99040;-117.44640;,
 -434.54722;1516.26252;-108.19201;,
 -337.17762;2023.45608;93.36320;,
 -0.30720;1427.57766;484.36480;,
 -488.92803;2022.63694;-55.54560;,
 -588.90880;2102.13773;-214.69441;,
 -659.79527;2118.26566;273.54881;,
 -367.43040;2022.82894;63.38560;,
 -172.48642;2155.76312;341.84961;,
 -107.96801;2190.60472;-146.30401;,
 -19.23840;6.77760;18.12480;,
 -103.17440;836.25607;-166.08642;,
 95.12321;-40.06400;-88.44160;,
 365.34400;1094.42570;-561.28634;,
 207.84002;1137.48478;-485.02398;,
 294.24642;1538.63039;-568.59527;,
 -128.64640;1193.81125;-234.60481;,
 415.17442;1489.10725;-681.28004;,
 618.94400;1507.27033;-889.25441;,
 35.65440;1575.73127;-909.03038;,
 315.33440;1528.15364;-587.98082;,
 36.45440;1745.08811;-346.33602;,
 619.59039;1675.41135;-326.18240;,
 14.34880;4.84480;22.95680;,
 -144.77440;845.30568;117.38241;,
 -70.09280;-30.62400;-113.66400;,
 -382.75201;1181.33117;-235.09761;,
 -428.45445;1149.93273;-408.07039;,
 -428.79361;1593.47209;-313.65120;,
 -200.47360;1207.46242;149.66400;,
 -518.07359;1555.96799;-458.10562;,
 -570.12481;1586.80334;-613.68331;,
 -726.81603;1659.35999;-248.69119;,
 -446.49605;1585.58723;-342.60481;,
 -358.95682;1751.16799;-110.10560;,
 -210.93120;1718.66878;-484.36480;,
 -134.10561;753.20323;448.17925;,
 -19.77600;1266.14406;269.12000;,
 -6.52800;-9.81760;25.58720;,
 73.77280;1317.47209;116.69120;,
 32.53760;42.47680;-129.73441;,
 32.53760;1668.72971;417.82398;,
 -173.78561;1079.25763;632.79361;,
 73.84320;1724.02561;253.59361;,
 138.62401;1898.78421;16.39680;,
 -378.14400;1789.20960;314.86722;,
 39.15520;1679.73128;382.96321;,
 -60.30720;1615.61594;801.68961;,
 456.46080;1746.40647;510.36163;,
 94.03520;-35.53280;-66.66880;,
 -18.75840;6.15040;14.02240;,
 113.89441;836.41603;-764.11520;,
 -253.84961;625.70240;-353.38240;,
 -34.02240;858.28478;-707.37926;,
 -38.45120;1185.87531;-882.78400;,
 -346.41922;897.76642;-502.70719;,
 80.81280;1141.79836;-968.10890;,
 203.04641;1166.46398;-1045.88800;,
 -140.22401;1135.21926;-1132.90890;,
 -14.46400;1176.80012;-899.62238;,
 -230.02242;1314.75188;-839.61603;,
 113.71520;1376.64006;-773.30563;,
 353.53602;750.05441;71.24480;,
 579.87203;1021.30568;-311.87200;,
 0.24960;3.20000;26.24640;,
 617.82398;969.26085;-474.20162;,
 -4.56960;-21.35040;-129.90081;,
 832.16007;1334.02883;-368.82559;,
 517.41441;1062.81603;91.33441;,
 827.06564;1308.07053;-533.92642;,
 861.04962;1338.13752;-813.42081;,
 525.27369;1602.21438;-436.77442;,
 829.12648;1329.06242;-403.20643;,
 876.92160;1449.11360;-15.75040;,
 1223.61594;1202.71359;-395.51360;,
 425.64483;628.01925;72.35840;,
 501.57442;872.19210;475.28961;,
 4.41600;5.49120;-23.16800;,
 430.45123;854.37443;617.41441;,
 -24.60800;-32.30720;113.58080;,
 622.98878;1203.25764;592.56964;,
 594.64322;901.34406;112.61441;,
 592.30079;1163.28957;737.15836;,
 554.32965;1191.93605;876.21759;,
 866.67521;1155.94240;710.30401;,
 616.59527;1195.00812;621.41441;,
 735.51363;1327.49445;428.02559;,
 436.77442;1394.56643;608.68482;,
 -234.01599;708.94723;531.39200;,
 -592.26241;1134.43840;390.43201;,
 18.73280;-2.92480;22.09920;,
 -90.93760;8.46080;-112.67201;,
 -669.67042;1173.88156;218.88001;,
 -707.90401;1546.34875;519.34078;,
 -331.30240;1022.08644;741.42721;,
 -823.85929;1558.39368;376.84481;,
 -1045.08156;1657.41448;180.74241;,
 -1070.64972;1401.81115;752.78722;,
 -733.25441;1547.19368;490.51519;,
 -480.20484;1583.48157;860.50568;,
 -462.68160;1859.15530;296.70401;,
 146.52801;791.59039;318.10562;,
 -142.80321;1040.60158;702.89918;,
 19.08480;9.42080;-17.42080;,
 -94.69440;-52.85120;83.72481;,
 -300.80000;989.45929;776.48644;,
 -209.16482;1424.72317;864.76798;,
 190.33600;1131.22570;452.39039;,
 -329.46561;1358.87365;971.70568;,
 -469.13282;1367.53283;1062.70724;,
 -78.11840;1421.15852;1147.94885;,
 -233.31841;1411.21281;885.93283;,
 -27.00160;1605.79211;792.62721;,
 -425.10079;1588.40315;727.44322;,
 21.38240;14.38720;10.21440;,
 -256.24322;820.41603;-150.11200;,
 -103.64800;-77.27360;-48.55040;,
 -792.07682;871.70568;-558.55362;,
 -685.67682;974.48966;-450.67520;,
 -845.23527;1317.24162;-645.79200;,
 -367.87200;1164.37131;-232.01922;,
 -977.44005;1220.32648;-707.92965;,
 -1232.33273;1152.12804;-842.90558;,
 -1120.48000;1433.12004;-328.17923;,
 -867.76964;1298.61760;-656.06407;,
 -595.29605;1618.27844;-543.38560;,
 -706.57926;1336.21125;-1057.65129;,
 253.51040;546.40636;283.02723;,
 95.81441;749.51681;610.97603;,
 14.96960;5.36960;-13.93280;,
 -75.39840;-31.02720;66.69440;,
 -27.28960;730.41925;674.09923;,
 116.09600;1035.58400;762.85441;,
 347.87200;783.98722;404.00001;,
 20.54400;997.09445;848.10890;,
 -78.29121;1018.63683;927.09122;,
 227.89761;991.34728;970.48322;,
 96.85120;1027.66086;779.71837;,
 278.38081;1148.12804;707.42399;,
 -26.27840;1202.17609;682.06080;,
 544.88316;1120.73595;139.20640;,
 713.12643;1060.26886;116.48001;,
 88.24960;837.97120;166.04801;,
 119.11040;-35.84640;-54.80320;,
 -24.36480;5.97760;10.73920;,
 708.88961;1484.57610;266.05440;,
 141.29921;1190.07365;246.04803;,
 860.58888;1440.35207;196.75520;,
 1136.08332;1449.17766;99.80161;,
 635.69923;1677.78577;-106.91200;,
 739.60323;1475.36643;249.73440;,
 399.31522;1646.40647;430.23360;,
 907.39835;1437.63205;641.13282;,
 809.28644;648.07042;19.76960;,
 780.96002;701.17120;156.11520;,
 566.86080;365.15840;-223.06560;,
 -0.92800;15.80800;111.28960;,
 -0.64640;-3.87840;-22.22080;,
 1041.94562;901.92648;-17.17120;,
 802.15040;532.69122;-310.57281;,
 1041.64484;922.74562;123.99361;,
 1096.87687;1001.61281;345.61922;,
 1316.21125;689.17760;44.81920;,
 1042.51525;904.67843;12.45440;,
 1087.51359;892.16007;-332.94720;,
 881.78556;1216.16642;-33.82400;,
 3.73760;-1.49760;24.86400;,
 -471.04644;579.94879;264.81280;,
 -15.21280;2.44480;-124.51200;,
 -682.10563;952.09601;-175.43040;,
 -701.31847;920.59523;-13.22880;,
 -877.61925;1263.13605;18.17600;,
 -663.34728;837.14562;366.47681;,
 -897.65763;1267.30236;-139.76321;,
 -976.72960;1339.07844;-387.41121;,
 -1237.64484;1104.40959;26.22720;,
 -882.93126;1262.45119;-14.60480;,
 -871.28966;1305.93273;371.80162;,
 -621.62560;1557.04953;-39.97440;;
 
 198;
 3;0,1,2;,
 3;1,3,2;,
 3;3,4,2;,
 4;5,0,2,6;,
 4;1,0,5,7;,
 3;8,9,10;,
 3;10,9,11;,
 3;8,10,12;,
 3;12,10,11;,
 4;13,14,15,16;,
 3;16,15,17;,
 4;18,19,13,20;,
 4;20,13,16,21;,
 3;22,23,18;,
 3;18,23,19;,
 3;19,23,13;,
 3;23,14,13;,
 4;21,16,17,24;,
 4;25,26,27,28;,
 3;28,27,29;,
 4;30,31,25,32;,
 4;32,25,28,33;,
 3;30,34,31;,
 3;34,35,31;,
 3;31,35,25;,
 3;35,26,25;,
 4;33,28,29,36;,
 4;37,38,39,40;,
 3;40,39,41;,
 4;42,43,37,44;,
 4;44,37,40,45;,
 3;46,38,47;,
 3;47,38,43;,
 3;38,37,43;,
 3;43,42,47;,
 4;45,40,41,48;,
 4;49,50,51,52;,
 3;52,51,53;,
 4;54,55,49,56;,
 4;56,49,52,57;,
 3;50,49,58;,
 3;49,55,58;,
 3;58,55,59;,
 3;55,54,59;,
 4;57,52,53,60;,
 4;61,62,63,64;,
 3;64,63,65;,
 4;66,67,61,68;,
 4;68,61,64,69;,
 3;61,67,62;,
 3;66,70,67;,
 3;62,67,71;,
 3;67,70,71;,
 4;69,64,65,72;,
 4;73,74,75,76;,
 3;76,75,77;,
 4;78,79,73,80;,
 4;80,73,76,81;,
 3;78,82,79;,
 3;73,79,74;,
 3;79,82,74;,
 3;82,83,74;,
 4;81,76,77,84;,
 3;85,86,87;,
 3;87,86,88;,
 3;86,89,88;,
 4;90,86,85,91;,
 4;89,86,90,92;,
 3;93,94,95;,
 3;95,94,96;,
 3;93,95,97;,
 3;97,95,96;,
 3;98,99,100;,
 3;100,99,101;,
 3;99,102,101;,
 4;103,99,98,104;,
 4;102,99,103,105;,
 3;106,107,108;,
 3;108,107,109;,
 3;106,108,110;,
 3;110,108,109;,
 3;111,112,113;,
 3;113,112,114;,
 3;112,115,114;,
 4;116,115,112,117;,
 4;114,115,116,118;,
 3;119,120,121;,
 3;121,120,122;,
 3;119,121,123;,
 3;123,121,122;,
 3;124,125,126;,
 3;125,127,126;,
 3;127,128,126;,
 4;129,127,125,130;,
 4;128,127,129,131;,
 3;132,133,134;,
 3;134,133,135;,
 3;132,134,136;,
 3;136,134,135;,
 3;137,138,139;,
 3;138,140,139;,
 3;140,141,139;,
 4;142,138,137,143;,
 4;140,138,142,144;,
 3;145,146,147;,
 3;147,146,148;,
 3;145,147,149;,
 3;149,147,148;,
 3;150,151,152;,
 3;151,153,152;,
 3;153,154,152;,
 4;155,154,153,156;,
 4;152,154,155,157;,
 3;158,159,160;,
 3;160,159,161;,
 3;158,160,162;,
 3;162,160,161;,
 3;163,164,165;,
 3;164,166,165;,
 3;166,167,165;,
 4;168,164,163,169;,
 4;166,164,168,170;,
 3;171,172,173;,
 3;173,172,174;,
 3;171,173,175;,
 3;175,173,174;,
 3;176,177,178;,
 3;177,179,178;,
 3;179,180,178;,
 4;181,177,176,182;,
 4;179,177,181,183;,
 3;184,185,186;,
 3;186,185,187;,
 3;184,186,188;,
 3;188,186,187;,
 3;189,190,191;,
 3;191,190,192;,
 3;190,193,192;,
 4;194,190,189,195;,
 4;193,190,194,196;,
 3;197,198,199;,
 3;199,198,200;,
 3;197,199,201;,
 3;201,199,200;,
 3;202,203,204;,
 3;204,203,205;,
 3;203,206,205;,
 4;207,203,202,208;,
 4;206,203,207,209;,
 3;210,211,212;,
 3;212,211,213;,
 3;210,212,214;,
 3;214,212,213;,
 3;215,216,217;,
 3;217,216,218;,
 3;216,219,218;,
 4;220,219,216,221;,
 4;218,219,220,222;,
 3;223,224,225;,
 3;225,224,226;,
 3;223,225,227;,
 3;227,225,226;,
 3;228,229,230;,
 3;230,229,231;,
 3;229,232,231;,
 4;233,229,228,234;,
 4;232,229,233,235;,
 3;236,237,238;,
 3;238,237,239;,
 3;236,238,240;,
 3;240,238,239;,
 3;241,242,243;,
 3;242,244,243;,
 3;244,245,243;,
 4;246,241,243,247;,
 4;242,241,246,248;,
 3;249,250,251;,
 3;251,250,252;,
 3;249,251,253;,
 3;253,251,252;,
 3;254,255,256;,
 3;255,257,256;,
 3;257,258,256;,
 4;259,254,256,260;,
 4;255,254,259,261;,
 3;262,263,264;,
 3;264,263,265;,
 3;262,264,266;,
 3;266,264,265;,
 3;267,268,269;,
 3;269,268,270;,
 3;268,271,270;,
 4;272,271,268,273;,
 4;270,271,272,274;,
 3;275,276,277;,
 3;277,276,278;,
 3;275,277,279;,
 3;279,277,278;;
 
 MeshMaterialList {
  1;
  198;
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
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
    "data\\TEXTURE\\flower\\ranunculus1.tga";
   }
  }
 }
 MeshNormals {
  281;
  0.080092;-0.078499;-0.993692;,
  -0.017134;-0.100229;-0.994817;,
  0.136840;-0.084558;-0.986978;,
  0.180245;-0.048386;-0.982431;,
  0.195839;-0.075445;-0.977730;,
  0.141133;0.030037;-0.989535;,
  0.129032;0.024968;-0.991326;,
  0.153210;0.035101;-0.987570;,
  -0.074895;0.997183;0.004125;,
  0.162622;0.956109;0.243739;,
  0.167677;0.985833;0.004251;,
  0.400367;0.916345;0.004126;,
  0.162962;0.958111;-0.235512;,
  -0.417598;0.906114;-0.067596;,
  -0.491047;0.856632;-0.158285;,
  -0.471863;0.850950;-0.230715;,
  -0.503423;0.860656;-0.076395;,
  -0.532342;0.843235;-0.074614;,
  -0.156305;0.979219;-0.129223;,
  -0.286301;0.957711;-0.028667;,
  -0.412980;0.906427;-0.088529;,
  -0.522434;0.848948;0.079684;,
  -0.002034;0.999213;-0.039606;,
  -0.278374;0.960473;-0.000669;,
  -0.534995;0.836414;0.119131;,
  -0.250599;0.906114;0.340820;,
  -0.364797;0.856634;0.364831;,
  -0.420500;0.850951;0.314741;,
  -0.297564;0.860653;0.413197;,
  -0.309164;0.843231;0.439750;,
  -0.331615;0.937850;0.102319;,
  -0.152266;0.968344;0.197798;,
  -0.267127;0.906426;0.327163;,
  -0.167342;0.848945;0.501287;,
  -0.148108;0.977041;0.153147;,
  -0.099085;0.934793;0.341091;,
  -0.137961;0.836409;0.530460;,
  -0.085433;0.916538;-0.390717;,
  -0.128529;0.942506;-0.308484;,
  -0.039343;0.850948;-0.523775;,
  -0.188453;0.860652;-0.473036;,
  -0.204604;0.843229;-0.497093;,
  0.091988;0.937850;-0.334626;,
  0.056665;0.951053;-0.303790;,
  -0.132272;0.906427;-0.401116;,
  -0.332740;0.848945;-0.410580;,
  -0.093642;0.961911;-0.256823;,
  -0.490660;0.852426;-0.180619;,
  -0.373129;0.836410;-0.401488;,
  0.384602;0.835148;-0.393203;,
  0.496973;0.776856;-0.386669;,
  0.541040;0.775307;-0.325844;,
  0.441159;0.777614;-0.447990;,
  0.456348;0.756066;-0.469160;,
  0.419160;0.895592;-0.149064;,
  0.265236;0.921840;-0.282595;,
  0.398074;0.836496;-0.376578;,
  0.330399;0.760582;-0.558884;,
  0.253046;0.936897;-0.241230;,
  0.238917;0.871440;-0.428382;,
  0.306459;0.745658;-0.591673;,
  0.466904;0.812070;0.350061;,
  0.493814;0.820104;0.289097;,
  0.528630;0.716238;0.455580;,
  0.588226;0.745877;0.312503;,
  0.614514;0.724620;0.311927;,
  0.312699;0.834332;0.453993;,
  0.398778;0.871302;0.286023;,
  0.503723;0.802795;0.319035;,
  0.633140;0.756940;0.161786;,
  0.313552;0.909026;0.274512;,
  0.490041;0.868123;0.078888;,
  0.650826;0.749184;0.123080;,
  0.169684;0.840031;0.515321;,
  0.212094;0.874618;0.435958;,
  0.122758;0.759090;0.639306;,
  0.270494;0.765194;0.584218;,
  0.285965;0.743271;0.604791;,
  -0.007172;0.882369;0.470504;,
  0.028097;0.897346;0.440433;,
  0.215876;0.825081;0.522148;,
  0.411369;0.752267;0.514655;,
  0.177241;0.903949;0.389181;,
  0.561807;0.778040;0.281116;,
  0.450333;0.738281;0.502137;,
  -0.927721;-0.050906;-0.369787;,
  -0.947581;-0.061083;-0.313623;,
  -0.927596;-0.018371;-0.373132;,
  -0.928172;-0.017417;-0.371743;,
  -0.898928;-0.001092;-0.438096;,
  -0.931489;0.044049;-0.361093;,
  -0.935797;0.037281;-0.350563;,
  -0.927018;0.050809;-0.371559;,
  -0.071070;0.982864;0.170081;,
  0.178097;0.983310;0.037191;,
  -0.028297;0.999527;-0.012073;,
  0.015488;0.980907;-0.193860;,
  -0.233337;0.970495;-0.060773;,
  -0.783944;-0.187651;0.591793;,
  -0.745028;-0.199867;0.636386;,
  -0.789486;-0.155474;0.593751;,
  -0.788668;-0.154597;0.595066;,
  -0.832070;-0.135081;0.537971;,
  -0.786393;-0.094108;0.610516;,
  -0.778983;-0.101290;0.618810;,
  -0.793665;-0.086911;0.602115;,
  0.052241;0.970544;0.235193;,
  0.161291;0.963603;-0.213203;,
  -0.128651;0.991689;0.001055;,
  -0.298183;0.925604;-0.233120;,
  -0.401720;0.890134;0.215135;,
  -0.641828;-0.210569;-0.737372;,
  -0.711749;-0.220160;-0.667041;,
  -0.596757;-0.222675;-0.770907;,
  -0.562697;-0.191828;-0.804098;,
  -0.548305;-0.219802;-0.806876;,
  -0.595500;-0.110689;-0.795693;,
  -0.605362;-0.114418;-0.787684;,
  -0.585534;-0.106940;-0.803563;,
  -0.050349;0.991560;-0.119471;,
  0.287027;0.951700;-0.109005;,
  0.122208;0.950598;-0.285356;,
  0.287563;0.853575;-0.434416;,
  -0.049751;0.894099;-0.445098;,
  -0.882301;-0.206150;0.423140;,
  -0.804938;-0.214551;0.553211;,
  -0.866509;-0.166804;0.470466;,
  -0.909850;-0.146553;0.388195;,
  -0.924989;-0.150758;0.348809;,
  -0.902582;-0.092495;0.420465;,
  -0.896875;-0.097135;0.431486;,
  -0.908130;-0.087840;0.409369;,
  -0.092565;0.994612;0.046678;,
  0.125066;0.926620;-0.354590;,
  -0.210465;0.952023;-0.222163;,
  -0.309824;0.825708;-0.471397;,
  -0.518420;0.852968;-0.060717;,
  -0.972747;0.073936;-0.219767;,
  -0.924029;0.076058;-0.374680;,
  -0.927597;0.110938;-0.356729;,
  -0.913878;0.121314;-0.387440;,
  -0.928621;0.112899;-0.353436;,
  -0.931489;0.165421;-0.323982;,
  -0.935799;0.155447;-0.316413;,
  -0.927016;0.175365;-0.331494;,
  -0.071065;0.864611;0.497391;,
  0.178092;0.910684;0.372744;,
  -0.028292;0.942837;0.332050;,
  0.015494;0.987804;0.154933;,
  -0.233324;0.932306;0.276343;,
  -0.620692;-0.481077;-0.619117;,
  -0.533434;-0.531474;-0.658015;,
  -0.440668;-0.575862;-0.688618;,
  -0.463517;-0.540401;-0.702224;,
  -0.483477;-0.552799;-0.678722;,
  -0.514602;-0.470355;-0.716904;,
  -0.523711;-0.473855;-0.707947;,
  -0.505403;-0.466773;-0.725735;,
  -0.239681;0.876097;-0.418338;,
  0.192930;0.942747;-0.272039;,
  0.013966;0.825860;-0.563703;,
  0.266322;0.702993;-0.659449;,
  -0.166790;0.601037;-0.781624;,
  -0.853961;0.517422;-0.054996;,
  -0.872048;0.446661;-0.200065;,
  -0.853499;0.481402;-0.199475;,
  -0.849561;0.473027;-0.233435;,
  -0.852262;0.484485;-0.197292;,
  -0.821344;0.536172;-0.194717;,
  -0.826193;0.532893;-0.182841;,
  -0.816350;0.539356;-0.206560;,
  0.494097;0.867494;0.057642;,
  0.671083;0.732263;-0.115924;,
  0.499078;0.856776;-0.129829;,
  0.486442;0.815808;-0.312779;,
  0.304546;0.942469;-0.137854;,
  0.875790;-0.479742;0.053276;,
  0.812384;-0.553550;0.183343;,
  0.832575;-0.520358;0.189859;,
  0.820520;-0.526599;0.222350;,
  0.834747;-0.517429;0.188320;,
  0.863219;-0.464947;0.196666;,
  0.863922;-0.468805;0.184015;,
  0.862364;-0.461008;0.209283;,
  0.458932;0.879950;0.122757;,
  0.040625;0.951802;0.304010;,
  0.369350;0.837668;0.402359;,
  0.247303;0.721717;0.646503;,
  0.649732;0.614053;0.448092;,
  -0.763894;-0.514294;0.389829;,
  -0.727130;-0.531377;0.434650;,
  -0.777112;-0.486080;0.399779;,
  -0.776643;-0.485498;0.401395;,
  -0.818429;-0.458715;0.346055;,
  -0.790212;-0.433473;0.433204;,
  -0.782031;-0.441185;0.440208;,
  -0.798255;-0.425685;0.426124;,
  -0.226664;0.822927;0.520975;,
  -0.198850;0.942984;0.266907;,
  -0.351994;0.853417;0.384421;,
  -0.464940;0.853790;0.234251;,
  -0.489153;0.725255;0.484493;,
  0.612578;-0.368889;0.699049;,
  0.658741;-0.358603;0.661410;,
  0.608975;-0.341189;0.716059;,
  0.610122;-0.339874;0.715708;,
  0.550371;-0.347117;0.759343;,
  0.614987;-0.281234;0.736681;,
  0.624416;-0.283749;0.727730;,
  0.605450;-0.278669;0.745503;,
  0.065651;0.944791;0.321031;,
  -0.374546;0.908076;0.187386;,
  -0.169237;0.860142;0.481160;,
  -0.389186;0.699866;0.598934;,
  0.058154;0.699784;0.711984;,
  -0.526634;0.006653;0.850066;,
  -0.441071;0.026517;0.897080;,
  -0.567888;-0.022607;0.822795;,
  -0.612206;-0.007901;0.790659;,
  -0.614376;-0.039294;0.788034;,
  -0.607692;0.079886;0.790145;,
  -0.597136;0.080381;0.798102;,
  -0.618142;0.079377;0.782048;,
  -0.241743;0.934567;-0.261045;,
  -0.306317;0.774314;-0.553721;,
  -0.436470;0.825826;-0.357078;,
  -0.605465;0.668385;-0.432057;,
  -0.541204;0.829222;-0.139605;,
  0.565360;-0.551634;0.613244;,
  0.610106;-0.547354;0.572865;,
  0.568756;-0.525559;0.632696;,
  0.570134;-0.524476;0.632354;,
  0.513166;-0.523609;0.680070;,
  0.588553;-0.470360;0.657546;,
  0.596636;-0.473864;0.647671;,
  0.580367;-0.466774;0.667305;,
  0.283195;0.876095;0.390203;,
  -0.162620;0.942748;0.291172;,
  0.046606;0.825857;0.561950;,
  -0.194025;0.702987;0.684225;,
  0.249701;0.601030;0.759218;,
  -0.257549;0.228212;-0.938929;,
  -0.352370;0.217605;-0.910211;,
  -0.204060;0.214803;-0.955102;,
  -0.155106;0.243288;-0.957472;,
  -0.144618;0.214714;-0.965911;,
  -0.177789;0.323463;-0.929388;,
  -0.190594;0.320426;-0.927901;,
  -0.164953;0.326442;-0.930713;,
  0.157825;0.955163;0.250511;,
  0.390864;0.844739;0.365570;,
  0.329331;0.927049;0.179227;,
  0.489267;0.866197;0.101592;,
  0.252914;0.967370;-0.015162;,
  0.598639;-0.773411;0.208488;,
  0.570879;-0.812077;0.120947;,
  0.596870;-0.757746;0.263756;,
  0.626432;-0.721277;0.295536;,
  0.605086;-0.730342;0.316972;,
  0.684819;-0.688575;0.238512;,
  0.680670;-0.696071;0.228414;,
  0.688848;-0.680957;0.248568;,
  0.758068;0.582559;-0.293187;,
  0.622800;0.771118;-0.132277;,
  0.774229;0.623185;-0.110500;,
  0.763062;0.641823;0.076149;,
  0.890559;0.447094;-0.083728;,
  -0.787929;-0.615696;-0.009241;,
  -0.755999;-0.649818;0.078759;,
  -0.791628;-0.607429;-0.065986;,
  -0.816685;-0.568569;-0.098774;,
  -0.801831;-0.585132;-0.121195;,
  -0.855729;-0.515859;-0.040227;,
  -0.851846;-0.522947;-0.029744;,
  -0.859461;-0.508680;-0.050703;,
  -0.543329;0.784843;0.298020;,
  -0.396103;0.913362;0.094192;,
  -0.579244;0.807005;0.114979;,
  -0.594723;0.800684;-0.072182;,
  -0.736104;0.664159;0.130553;,
  -0.999968;0.006023;-0.005290;;
  198;
  3;3,4,2;,
  3;4,0,2;,
  3;0,1,2;,
  4;5,3,2,6;,
  4;4,3,5,7;,
  3;8,9,10;,
  3;10,9,11;,
  3;8,10,12;,
  3;12,10,11;,
  4;13,14,15,16;,
  3;16,15,17;,
  4;18,19,13,20;,
  4;20,13,16,21;,
  3;22,23,18;,
  3;280,280,280;,
  3;19,23,13;,
  3;23,14,13;,
  4;21,16,17,24;,
  4;25,26,27,28;,
  3;28,27,29;,
  4;30,31,25,32;,
  4;32,25,28,33;,
  3;30,34,31;,
  3;34,35,31;,
  3;31,35,25;,
  3;35,26,25;,
  4;33,28,29,36;,
  4;37,38,39,40;,
  3;40,39,41;,
  4;42,43,37,44;,
  4;44,37,40,45;,
  3;47,38,46;,
  3;46,38,43;,
  3;38,37,43;,
  3;43,42,46;,
  4;45,40,41,48;,
  4;49,50,51,52;,
  3;52,51,53;,
  4;54,55,49,56;,
  4;56,49,52,57;,
  3;50,49,59;,
  3;49,55,59;,
  3;59,55,58;,
  3;55,54,58;,
  4;57,52,53,60;,
  4;61,62,63,64;,
  3;64,63,65;,
  4;66,67,61,68;,
  4;68,61,64,69;,
  3;61,67,62;,
  3;66,70,67;,
  3;62,67,71;,
  3;67,70,71;,
  4;69,64,65,72;,
  4;73,74,75,76;,
  3;76,75,77;,
  4;78,79,73,80;,
  4;80,73,76,81;,
  3;78,82,79;,
  3;73,79,74;,
  3;79,82,74;,
  3;82,83,74;,
  4;81,76,77,84;,
  3;87,88,86;,
  3;86,88,85;,
  3;88,89,85;,
  4;90,88,87,91;,
  4;89,88,90,92;,
  3;93,94,95;,
  3;95,94,96;,
  3;93,95,97;,
  3;97,95,96;,
  3;100,101,99;,
  3;99,101,98;,
  3;101,102,98;,
  4;103,101,100,104;,
  4;102,101,103,105;,
  3;106,107,108;,
  3;108,107,109;,
  3;106,108,110;,
  3;110,108,109;,
  3;112,113,111;,
  3;111,113,115;,
  3;113,114,115;,
  4;116,114,113,117;,
  4;115,114,116,118;,
  3;119,120,121;,
  3;121,120,122;,
  3;119,121,123;,
  3;123,121,122;,
  3;125,126,124;,
  3;126,127,124;,
  3;127,128,124;,
  4;129,127,126,130;,
  4;128,127,129,131;,
  3;132,133,134;,
  3;134,133,135;,
  3;132,134,136;,
  3;136,134,135;,
  3;139,140,138;,
  3;140,141,138;,
  3;141,137,138;,
  4;142,140,139,143;,
  4;141,140,142,144;,
  3;145,146,147;,
  3;147,146,148;,
  3;145,147,149;,
  3;149,147,148;,
  3;150,151,154;,
  3;151,152,154;,
  3;152,153,154;,
  4;155,153,152,156;,
  4;154,153,155,157;,
  3;158,159,160;,
  3;160,159,161;,
  3;158,160,162;,
  3;162,160,161;,
  3;165,166,164;,
  3;166,167,164;,
  3;167,163,164;,
  4;168,166,165,169;,
  4;167,166,168,170;,
  3;171,172,173;,
  3;173,172,174;,
  3;171,173,175;,
  3;175,173,174;,
  3;178,179,177;,
  3;179,180,177;,
  3;180,176,177;,
  4;181,179,178,182;,
  4;180,179,181,183;,
  3;184,185,186;,
  3;186,185,187;,
  3;184,186,188;,
  3;188,186,187;,
  3;191,192,190;,
  3;190,192,189;,
  3;192,193,189;,
  4;194,192,191,195;,
  4;193,192,194,196;,
  3;197,198,199;,
  3;199,198,200;,
  3;197,199,201;,
  3;201,199,200;,
  3;204,205,203;,
  3;203,205,202;,
  3;205,206,202;,
  4;207,205,204,208;,
  4;206,205,207,209;,
  3;210,211,212;,
  3;212,211,213;,
  3;210,212,214;,
  3;214,212,213;,
  3;216,217,215;,
  3;215,217,219;,
  3;217,218,219;,
  4;220,218,217,221;,
  4;219,218,220,222;,
  3;223,224,225;,
  3;225,224,226;,
  3;223,225,227;,
  3;227,225,226;,
  3;230,231,229;,
  3;229,231,228;,
  3;231,232,228;,
  4;233,231,230,234;,
  4;232,231,233,235;,
  3;236,237,238;,
  3;238,237,239;,
  3;236,238,240;,
  3;240,238,239;,
  3;244,245,243;,
  3;245,241,243;,
  3;241,242,243;,
  4;246,244,243,247;,
  4;245,244,246,248;,
  3;249,250,251;,
  3;251,250,252;,
  3;249,251,253;,
  3;253,251,252;,
  3;257,258,256;,
  3;258,254,256;,
  3;254,255,256;,
  4;259,257,256,260;,
  4;258,257,259,261;,
  3;262,263,264;,
  3;264,263,265;,
  3;262,264,266;,
  3;266,264,265;,
  3;268,269,267;,
  3;267,269,271;,
  3;269,270,271;,
  4;272,270,269,273;,
  4;271,270,272,274;,
  3;275,276,277;,
  3;277,276,278;,
  3;275,277,279;,
  3;279,277,278;;
 }
 MeshTextureCoords {
  280;
  0.875000;0.625000;,
  0.823100;0.625000;,
  0.977200;0.750000;,
  0.875000;1.000000;,
  0.924100;1.000000;,
  0.875000;0.500000;,
  1.000000;0.642800;,
  0.823100;0.500000;,
  0.000000;0.375000;,
  0.125000;0.500000;,
  0.125000;0.375000;,
  0.250000;0.375000;,
  0.125000;0.250000;,
  0.750000;0.125000;,
  0.750000;0.239100;,
  0.875000;0.188800;,
  0.875000;0.125000;,
  1.000000;0.138400;,
  0.625000;0.000000;,
  0.625000;0.125000;,
  0.750000;0.000000;,
  0.875000;0.052800;,
  0.471500;0.111700;,
  0.612900;0.280200;,
  1.000000;0.107000;,
  0.750000;0.125000;,
  0.750000;0.239100;,
  0.875000;0.188800;,
  0.875000;0.125000;,
  1.000000;0.138400;,
  0.625000;0.000000;,
  0.625000;0.125000;,
  0.750000;0.000000;,
  0.875000;0.052800;,
  0.471500;0.111700;,
  0.612900;0.280200;,
  1.000000;0.107000;,
  0.750000;0.125000;,
  0.750000;0.239100;,
  0.875000;0.188800;,
  0.875000;0.125000;,
  1.000000;0.138400;,
  0.625000;0.000000;,
  0.625000;0.125000;,
  0.750000;0.000000;,
  0.875000;0.052800;,
  0.612900;0.280200;,
  0.471500;0.111700;,
  1.000000;0.107000;,
  0.750000;0.125000;,
  0.750000;0.239100;,
  0.875000;0.188800;,
  0.875000;0.125000;,
  1.000000;0.138400;,
  0.625000;0.000000;,
  0.625000;0.125000;,
  0.750000;0.000000;,
  0.875000;0.052800;,
  0.612900;0.280200;,
  0.471500;0.111700;,
  1.000000;0.107000;,
  0.750000;0.125000;,
  0.750000;0.239100;,
  0.875000;0.188800;,
  0.875000;0.125000;,
  1.000000;0.138400;,
  0.625000;0.000000;,
  0.625000;0.125000;,
  0.750000;0.000000;,
  0.875000;0.052800;,
  0.471500;0.111700;,
  0.612900;0.280200;,
  1.000000;0.107000;,
  0.750000;0.125000;,
  0.750000;0.239100;,
  0.875000;0.188800;,
  0.875000;0.125000;,
  1.000000;0.138400;,
  0.625000;0.000000;,
  0.625000;0.125000;,
  0.750000;0.000000;,
  0.875000;0.052800;,
  0.471500;0.111700;,
  0.612900;0.280200;,
  1.000000;0.107000;,
  0.977200;0.750000;,
  0.875000;0.625000;,
  0.924100;1.000000;,
  0.875000;1.000000;,
  0.823100;0.625000;,
  0.875000;0.500000;,
  1.000000;0.642800;,
  0.823100;0.500000;,
  0.000000;0.125000;,
  0.125000;0.250000;,
  0.125000;0.125000;,
  0.250000;0.125000;,
  0.125000;0.000000;,
  0.977200;0.750000;,
  0.875000;0.625000;,
  0.924100;1.000000;,
  0.875000;1.000000;,
  0.823100;0.625000;,
  0.875000;0.500000;,
  1.000000;0.642800;,
  0.823100;0.500000;,
  0.000000;0.625000;,
  0.125000;0.750000;,
  0.125000;0.625000;,
  0.250000;0.625000;,
  0.125000;0.500000;,
  0.924100;1.000000;,
  0.977200;0.750000;,
  0.875000;1.000000;,
  0.823100;0.625000;,
  0.875000;0.625000;,
  0.875000;0.500000;,
  1.000000;0.642800;,
  0.823100;0.500000;,
  0.000000;0.375000;,
  0.125000;0.500000;,
  0.125000;0.375000;,
  0.250000;0.375000;,
  0.125000;0.250000;,
  0.924100;1.000000;,
  0.977200;0.750000;,
  0.875000;1.000000;,
  0.875000;0.625000;,
  0.823100;0.625000;,
  0.875000;0.500000;,
  1.000000;0.642800;,
  0.823100;0.500000;,
  0.000000;0.625000;,
  0.125000;0.750000;,
  0.125000;0.625000;,
  0.250000;0.625000;,
  0.125000;0.500000;,
  0.977200;0.750000;,
  0.875000;0.625000;,
  0.924100;1.000000;,
  0.823100;0.625000;,
  0.875000;1.000000;,
  0.875000;0.500000;,
  1.000000;0.642800;,
  0.823100;0.500000;,
  0.000000;0.125000;,
  0.125000;0.250000;,
  0.125000;0.125000;,
  0.250000;0.125000;,
  0.125000;0.000000;,
  0.875000;1.000000;,
  0.924100;1.000000;,
  0.823100;0.625000;,
  0.977200;0.750000;,
  0.875000;0.625000;,
  0.875000;0.500000;,
  1.000000;0.642800;,
  0.823100;0.500000;,
  0.000000;0.625000;,
  0.125000;0.750000;,
  0.125000;0.625000;,
  0.250000;0.625000;,
  0.125000;0.500000;,
  0.977200;0.750000;,
  0.875000;0.625000;,
  0.924100;1.000000;,
  0.823100;0.625000;,
  0.875000;1.000000;,
  0.875000;0.500000;,
  1.000000;0.642800;,
  0.823100;0.500000;,
  0.000000;0.125000;,
  0.125000;0.250000;,
  0.125000;0.125000;,
  0.250000;0.125000;,
  0.125000;0.000000;,
  0.977200;0.750000;,
  0.875000;0.625000;,
  0.924100;1.000000;,
  0.823100;0.625000;,
  0.875000;1.000000;,
  0.875000;0.500000;,
  1.000000;0.642800;,
  0.823100;0.500000;,
  0.000000;0.625000;,
  0.125000;0.750000;,
  0.125000;0.625000;,
  0.250000;0.625000;,
  0.125000;0.500000;,
  0.977200;0.750000;,
  0.875000;0.625000;,
  0.924100;1.000000;,
  0.875000;1.000000;,
  0.823100;0.625000;,
  0.875000;0.500000;,
  1.000000;0.642800;,
  0.823100;0.500000;,
  0.000000;0.125000;,
  0.125000;0.250000;,
  0.125000;0.125000;,
  0.250000;0.125000;,
  0.125000;0.000000;,
  0.977200;0.750000;,
  0.875000;0.625000;,
  0.924100;1.000000;,
  0.875000;1.000000;,
  0.823100;0.625000;,
  0.875000;0.500000;,
  1.000000;0.642800;,
  0.823100;0.500000;,
  0.000000;0.625000;,
  0.125000;0.750000;,
  0.125000;0.625000;,
  0.250000;0.625000;,
  0.125000;0.500000;,
  0.924100;1.000000;,
  0.977200;0.750000;,
  0.875000;1.000000;,
  0.823100;0.625000;,
  0.875000;0.625000;,
  0.875000;0.500000;,
  1.000000;0.642800;,
  0.823100;0.500000;,
  0.000000;0.375000;,
  0.125000;0.500000;,
  0.125000;0.375000;,
  0.250000;0.375000;,
  0.125000;0.250000;,
  0.977200;0.750000;,
  0.875000;0.625000;,
  0.924100;1.000000;,
  0.875000;1.000000;,
  0.823100;0.625000;,
  0.875000;0.500000;,
  1.000000;0.642800;,
  0.823100;0.500000;,
  0.000000;0.625000;,
  0.125000;0.750000;,
  0.125000;0.625000;,
  0.250000;0.625000;,
  0.125000;0.500000;,
  0.875000;0.625000;,
  0.823100;0.625000;,
  0.977200;0.750000;,
  0.875000;1.000000;,
  0.924100;1.000000;,
  0.875000;0.500000;,
  1.000000;0.642800;,
  0.823100;0.500000;,
  0.000000;0.125000;,
  0.125000;0.250000;,
  0.125000;0.125000;,
  0.250000;0.125000;,
  0.125000;0.000000;,
  0.875000;0.625000;,
  0.823100;0.625000;,
  0.977200;0.750000;,
  0.875000;1.000000;,
  0.924100;1.000000;,
  0.875000;0.500000;,
  1.000000;0.642800;,
  0.823100;0.500000;,
  0.000000;0.125000;,
  0.125000;0.250000;,
  0.125000;0.125000;,
  0.250000;0.125000;,
  0.125000;0.000000;,
  0.924100;1.000000;,
  0.977200;0.750000;,
  0.875000;1.000000;,
  0.823100;0.625000;,
  0.875000;0.625000;,
  0.875000;0.500000;,
  1.000000;0.642800;,
  0.823100;0.500000;,
  0.000000;0.125000;,
  0.125000;0.250000;,
  0.125000;0.125000;,
  0.250000;0.125000;,
  0.125000;0.000000;;
 }
}
