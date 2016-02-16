//Maya ASCII 2015 scene
//Name: hex_sphere_seperated.ma
//Last modified: Wed, Feb 17, 2016 12:47:22 AM
//Codeset: 1252
requires maya "2015";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2015";
fileInfo "version" "2015";
fileInfo "cutIdentifier" "201405190330-916664";
fileInfo "osv" "Microsoft Windows 8 Business Edition, 64-bit  (Build 9200)\n";
fileInfo "license" "student";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 14.329638843825961 11.981766289193406 0.99279447689287359 ;
	setAttr ".r" -type "double3" -405.33835272978598 -639.39999999990573 0 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 22.396794546217237;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0 0 1.6094507060415708e-008 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "IcosaSphere";
createNode transform -n "polySurface1" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.048733070492744446 3.9194960594177246 -1.4901161193847655e-008 ;
	setAttr ".sp" -type "double3" 0.048733070492744446 3.9194960594177246 -1.4901161193847655e-008 ;
createNode mesh -n "polySurfaceShape2" -p "polySurface1";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49995522759854794 0.49999998509883881 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 5 ".uvst[0].uvsp[0:4]" -type "float2" 0.48546559 0.92362475
		 0.59386331 0.92362475 0.70226097 0.92362475 0.4611457 0.97076821 0.37706792 0.92362475;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.0033236898 -5.9604645e-008 
		-0.014803935 -0.014079364 -5.9604645e-008 2.8742231e-009 -0.0033236877 -5.9604645e-008 
		0.014803935 0.014079379 -5.9604645e-008 0.0091493167 0.014079377 -5.9604645e-008 
		-0.0091493381 -9.3132257e-010 9.3132257e-010 -2.220446e-015 -2.7939677e-009 9.3132257e-010 
		-3.7252903e-009 1.1641532e-009 9.3132257e-010 -2.7939677e-009 4.6566129e-009 9.3132257e-010 
		9.3132257e-009 6.519258e-009 9.3132257e-010 3.7252903e-009;
	setAttr -s 5 ".vt[0:4]"  0.15770365 3.91949606 0.48536164 0.51033944 3.91949606 -1.0913722e-007
		 0.15770346 3.91949606 -0.48536167 -0.4128733 3.91949606 -0.29996991 -0.41287324 3.91949606 0.29997009;
	setAttr -s 5 ".ed[0:4]"  1 0 0 2 1 0 0 4 0 3 2 0 4 3 0;
	setAttr -ch 5 ".fc[0]" -type "polyFaces" 
		f 5 -1 -2 -4 -5 -3
		mu 0 5 0 1 2 3 4;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface2" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.844498753547668 1.7092640399932859 2.1020558476448055 ;
	setAttr ".sp" -type "double3" 2.844498753547668 1.7092640399932859 2.1020558476448055 ;
createNode mesh -n "polySurfaceShape3" -p "polySurface2";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.59638786315917969 0.46865016222000122 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 5 ".uvst[0].uvsp[0:4]" -type "float2" 0.58784121 0.59962487
		 0.60651553 0.62529343 0.59991199 0.66898584 0.57577044 0.66898584 0.56916696 0.62529337;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.0053778547 0.012592934 
		-0.0028273019 -0.010187932 0.0029727488 0.011976619 -0.00056775502 -0.012593068 0.011976657 
		0.010187947 -0.012593031 -0.0028272984 0.0072151385 0.0029727451 -0.011976627 9.3132257e-010 
		-1.1641532e-009 -9.3132257e-009 -4.1909516e-009 -5.5879354e-009 -1.1641532e-009 -1.7462298e-010 
		9.3132257e-010 -1.8626451e-008 1.8626451e-009 2.7939677e-009 -1.6298145e-009 1.8626451e-009 
		-1.1641532e-009 3.7252903e-009;
	setAttr -s 5 ".vt[0:4]"  3.020816803 1.29639077 2.19475174 3.1785202 1.61179757 1.70939004
		 2.86311316 2.12213731 1.70938981 2.5104773 2.12213707 2.1947515 2.6079433 1.61179769 2.49472189;
	setAttr -s 5 ".ed[0:4]"  3 2 0 2 1 0 0 4 0 1 0 0 4 3 0;
	setAttr -ch 5 ".fc[0]" -type "polyFaces" 
		f 5 -4 -2 -1 -5 -3
		mu 0 5 0 1 2 3 4;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface3" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.8444986343383789 1.7092638611793518 -2.1020557284355164 ;
	setAttr ".sp" -type "double3" 2.8444986343383789 1.7092638611793518 -2.1020557284355164 ;
createNode mesh -n "polySurfaceShape4" -p "polySurface3";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.59638786315917969 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 5 ".uvst[0].uvsp[0:4]" -type "float2" 0.76046771 0.59962487
		 0.77914208 0.62529343 0.7725386 0.66898584 0.74839693 0.66898584 0.74179345 0.62529343;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.005377851 0.012592947 
		0.0028273058 0.0072151348 0.0029727435 0.011976608 0.010187921 -0.012593037 0.0028273202 
		-0.00056774955 -0.012593037 -0.011976612 -0.010187921 0.0029727397 -0.011976623 3.7252903e-009 
		-1.1641532e-009 2.7939677e-009 3.7252903e-009 9.3132257e-009 4.6566129e-010 0 1.8626451e-009 
		4.6566129e-010 -7.5669959e-010 1.8626451e-009 -5.5879354e-009 0 -9.3132257e-010 1.8626451e-009;
	setAttr -s 5 ".vt[0:4]"  3.020816803 1.29639065 -2.1947515 2.6079433 1.61179757 -2.49472165
		 2.51047707 2.12213707 -2.19475198 2.86311293 2.12213707 -1.70939016 3.1785202 1.61179769 -1.70938981;
	setAttr -s 5 ".ed[0:4]"  3 2 0 4 3 0 0 4 0 1 0 0 2 1 0;
	setAttr -ch 5 ".fc[0]" -type "polyFaces" 
		f 5 -4 -5 -1 -2 -3
		mu 0 5 0 1 2 3 4;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface4" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.105116158723831 1.7092639207839964 -3.3085019588470455 ;
	setAttr ".sp" -type "double3" -1.105116158723831 1.7092639207839964 -3.3085019588470455 ;
createNode mesh -n "polySurfaceShape5" -p "polySurface4";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.59638786315917969 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 5 ".uvst[0].uvsp[0:4]" -type "float2" 0.069961622 0.59962487
		 0.088635907 0.62529343 0.082032397 0.66898584 0.057890814 0.66898584 0.051287275
		 0.62529337;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 10 ".pt[0:9]" -type "float3"  0.0014863961 0.012592975 
		0.007401959 0.014079382 0.0029728012 -0.001747366 0.0062964954 -0.012592975 -0.0074019735 
		-0.011106571 -0.012592975 -0.001747366 -0.014079382 0.0029727975 0.0074019735 -1.0244548e-008 
		-2.0791776e-007 2.3283064e-010 -6.9849193e-010 -1.8998981e-007 -9.778887e-009 1.071021e-008 
		-2.3841858e-007 -6.0535967e-009 1.2107193e-008 -2.3841858e-007 2.3283064e-010 -1.2107193e-008 
		3.4691766e-008 9.778887e-009;
	setAttr -s 5 ".vt[0:4]"  -1.15384912 1.29639077 -3.55118251 -1.56672263 1.61179769 -3.25121284
		 -1.311553 2.12213707 -3.065820932 -0.74097621 2.12213707 -3.25121284 -0.64350969 1.61179781 -3.55118299;
	setAttr -s 5 ".ed[0:4]"  3 2 0 4 3 0 0 4 0 1 0 0 2 1 0;
	setAttr -ch 5 ".fc[0]" -type "polyFaces" 
		f 5 -4 -5 -1 -2 -3
		mu 0 5 0 1 2 3 4;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface5" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.5274981260299678 1.7092638611793518 -4.4703483581542969e-008 ;
	setAttr ".sp" -type "double3" -3.5274981260299678 1.7092638611793518 -4.4703483581542969e-008 ;
createNode mesh -n "polySurfaceShape6" -p "polySurface5";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.59638786315917969 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 5 ".uvst[0].uvsp[0:4]" -type "float2" 0.24258815 0.59962481
		 0.26126245 0.62529337 0.25465894 0.66898584 0.23051734 0.66898578 0.22391383 0.62529337;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 10 ".pt[0:9]" -type "float3"  0.0062964857 0.012592977 
		8.1364387e-010 0.0014864078 0.0029727994 -0.014803937 -0.0062964857 -0.012592977 
		-0.0091493446 -0.0062964857 -0.012592977 0.0091493251 0.0014863933 0.0029727959 0.014803937 
		3.4924597e-010 -2.0978041e-007 -7.4505806e-009 5.5879354e-009 -1.5832484e-007 -6.2339023e-014 
		1.8626451e-009 -2.1886081e-007 -3.5390258e-008 1.8626451e-009 -2.1886081e-007 -5.5879354e-009 
		1.8626451e-009 -2.0535663e-007 7.4505806e-009;
	setAttr -s 5 ".vt[0:4]"  -3.73393464 1.29639065 -7.1379603e-008 -3.57623148 1.61179769 0.48536167
		 -3.32106161 2.12213707 0.29997027 -3.32106161 2.12213707 -0.29996973 -3.576231 1.61179781 -0.48536175;
	setAttr -s 5 ".ed[0:4]"  3 2 0 4 3 0 0 4 0 1 0 0 2 1 0;
	setAttr -ch 5 ".fc[0]" -type "polyFaces" 
		f 5 -4 -5 -1 -2 -3
		mu 0 5 0 1 2 3 4;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface6" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.1051162481307981 1.7092640399932859 3.3085020780563354 ;
	setAttr ".sp" -type "double3" -1.1051162481307981 1.7092640399932859 3.3085020780563354 ;
createNode mesh -n "polySurfaceShape7" -p "polySurface6";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.59638786315917969 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 5 ".uvst[0].uvsp[0:4]" -type "float2" 0.41521466 0.59962487
		 0.43388891 0.62529343 0.42728549 0.66898584 0.40314385 0.66898584 0.39654034 0.62529343;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 10 ".pt[0:9]" -type "float3"  0.0014864006 0.012592979 
		-0.0074019553 -0.014079379 0.0029728049 -0.0074019697 -0.011106589 -0.012592979 0.0017473696 
		0.0062964819 -0.012592971 0.0074019697 0.014079379 0.0029728012 0.0017473696 4.6566129e-009 
		-2.1397136e-007 -1.816079e-008 1.1641532e-009 -1.5832484e-007 -1.8626451e-009 -1.5832484e-008 
		-2.3562461e-007 1.5133992e-009 2.7939677e-009 -1.7881393e-007 -7.4505806e-009 -5.5879354e-009 
		-2.1397136e-007 1.5133992e-009;
	setAttr -s 5 ".vt[0:4]"  -1.15384936 1.29639077 3.55118251 -0.64350986 1.61179769 3.55118299
		 -0.74097574 2.12213731 3.25121284 -1.31155264 2.12213707 3.065821171 -1.56672263 1.61179781 3.25121284;
	setAttr -s 5 ".ed[0:4]"  3 2 0 4 3 0 0 4 0 1 0 0 2 1 0;
	setAttr -ch 5 ".fc[0]" -type "polyFaces" 
		f 5 -4 -5 -1 -2 -3
		mu 0 5 0 1 2 3 4;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface7" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.5274980068206787 -1.7092640399932859 -4.4703483581542969e-008 ;
	setAttr ".sp" -type "double3" 3.5274980068206787 -1.7092640399932859 -4.4703483581542969e-008 ;
createNode mesh -n "polySurfaceShape8" -p "polySurface7";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.59638786315917969 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 5 ".uvst[0].uvsp[0:4]" -type "float2" 0.68622524 0.33101416
		 0.69282871 0.37470657 0.67415452 0.40037513 0.65548015 0.37470657 0.66208369 0.33101416;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 10 ".pt[0:9]" -type "float3"  0.0062964819 0.012592979 
		0.0091493251 -0.001486397 -0.0029728012 0.014803937 -0.0062964894 -0.012592979 8.1364404e-010 
		-0.001486397 -0.0029728049 -0.014803937 0.0062964894 0.012592979 -0.0091493446 5.8207661e-010 
		-1.5483238e-007 7.4505806e-009 -8.8475645e-009 -1.5180558e-007 -5.5879354e-009 -1.3504177e-008 
		-1.9930303e-007 -6.3893335e-014 5.8207661e-010 -1.5483238e-007 -7.4505806e-009 -8.8475645e-009 
		-1.5180558e-007 -3.5390258e-008;
	setAttr -s 5 ".vt[0:4]"  3.32106161 -2.12213731 -0.29996973 3.576231 -1.61179781 -0.48536175
		 3.73393464 -1.29639077 -7.137961e-008 3.576231 -1.61179769 0.48536167 3.32106137 -2.12213731 0.29997027;
	setAttr -s 5 ".ed[0:4]"  2 1 0 1 0 0 0 4 0 3 2 0 4 3 0;
	setAttr -ch 5 ".fc[0]" -type "polyFaces" 
		f 5 -2 -1 -4 -5 -3
		mu 0 5 0 1 2 3 4;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface8" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.105116158723831 -1.7092639207839964 -3.3085019588470455 ;
	setAttr ".sp" -type "double3" 1.105116158723831 -1.7092639207839964 -3.3085019588470455 ;
createNode mesh -n "polySurfaceShape9" -p "polySurface8";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.59638786315917969 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 5 ".uvst[0].uvsp[0:4]" -type "float2" 0.85885185 0.33101419
		 0.86545533 0.37470657 0.84678096 0.40037516 0.8281067 0.3747066 0.83471018 0.33101419;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 10 ".pt[0:9]" -type "float3"  0.011106571 0.012592975 -0.001747366 
		0.014079382 -0.0029727975 0.0074019735 -0.0014863961 -0.012592975 0.007401959 -0.014079382 
		-0.0029728012 -0.001747366 -0.0062964954 0.012592975 -0.0074019735 1.2107193e-008 
		-1.5762635e-007 9.778887e-009 -1.2107193e-008 -1.7881393e-007 2.3283064e-010 6.9849193e-010 
		-1.9744039e-007 -9.778887e-009 1.0244548e-008 -1.4598481e-007 2.3283064e-010 -1.071021e-008 
		-1.7881393e-007 -6.0535967e-009;
	setAttr -s 5 ".vt[0:4]"  0.74097621 -2.12213707 -3.25121284 0.64350969 -1.61179781 -3.55118299
		 1.15384912 -1.29639077 -3.55118251 1.56672263 -1.61179769 -3.25121284 1.311553 -2.12213707 -3.065820932;
	setAttr -s 5 ".ed[0:4]"  3 2 0 4 3 0 0 4 0 1 0 0 2 1 0;
	setAttr -ch 5 ".fc[0]" -type "polyFaces" 
		f 5 -4 -5 -1 -2 -3
		mu 0 5 0 1 2 3 4;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface9" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.8444986343383789 -1.7092639060194836 -2.1020557284355164 ;
	setAttr ".sp" -type "double3" -2.8444986343383789 -1.7092639060194836 -2.1020557284355164 ;
createNode mesh -n "polySurfaceShape10" -p "polySurface9";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.59638786315917969 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 5 ".uvst[0].uvsp[0:4]" -type "float2" 0.1683457 0.33101419
		 0.17494915 0.37470657 0.15627487 0.40037516 0.13760056 0.3747066 0.14420407 0.33101422;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 10 ".pt[0:9]" -type "float3"  0.00056774955 0.01259296 
		-0.011976612 0.010187921 -0.0029728424 -0.011976623 0.0053778435 -0.012593031 0.0028273058 
		-0.0072151348 -0.0029728424 0.011976608 -0.010187921 0.01259296 0.0028273202 0 9.3132257e-010 
		1.8626451e-009 7.5669959e-010 -1.8626451e-009 -5.5879354e-009 -3.7252903e-009 -9.3132257e-009 
		4.6566129e-010 -3.7252903e-009 1.1641532e-009 2.7939677e-009 0 -1.8626451e-009 4.6566129e-010;
	setAttr -s 5 ".vt[0:4]"  -2.86311293 -2.12213707 -1.70939016 -3.1785202 -1.61179781 -1.70938981
		 -3.020816565 -1.29639077 -2.1947515 -2.6079433 -1.61179781 -2.49472165 -2.51047707 -2.12213707 -2.19475198;
	setAttr -s 5 ".ed[0:4]"  3 2 0 4 3 0 0 4 0 1 0 0 2 1 0;
	setAttr -ch 5 ".fc[0]" -type "polyFaces" 
		f 5 -4 -5 -1 -2 -3
		mu 0 5 0 1 2 3 4;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface10" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.844498753547668 -1.7092639656241282 2.1020557880401611 ;
	setAttr ".sp" -type "double3" -2.844498753547668 -1.7092639656241282 2.1020557880401611 ;
createNode mesh -n "polySurfaceShape11" -p "polySurface10";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.59638786315917969 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 5 ".uvst[0].uvsp[0:4]" -type "float2" 0.34097216 0.33101419
		 0.34757566 0.37470657 0.32890135 0.40037516 0.31022707 0.37470657 0.31683058 0.33101419;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.010187947 0.012592943 
		-0.0028272928 -0.0072151385 -0.0029728368 -0.011976629 0.0053778477 -0.012593029 
		-0.0028273 0.010187932 -0.0029728441 0.011976606 0.0005677478 0.012592943 0.011976658 
		-1.8626451e-009 -3.4924597e-009 -8.3819032e-009 -1.8626451e-009 9.3132257e-009 -6.9849193e-010 
		4.1909516e-009 -1.8626451e-009 -2.3283064e-009 -9.3132257e-010 -1.3969839e-009 9.3132257e-010 
		1.7462298e-010 9.3132257e-009 -9.3132257e-009;
	setAttr -s 5 ".vt[0:4]"  -2.5104773 -2.12213707 2.1947515 -2.6079433 -1.61179781 2.49472189
		 -3.020816565 -1.29639089 2.19475174 -3.1785202 -1.61179769 1.70938993 -2.86311293 -2.12213707 1.70938969;
	setAttr -s 5 ".ed[0:4]"  3 2 0 4 3 0 0 4 0 1 0 0 2 1 0;
	setAttr -ch 5 ".fc[0]" -type "polyFaces" 
		f 5 -4 -5 -1 -2 -3
		mu 0 5 0 1 2 3 4;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface11" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.1051161885261533 -1.7092640399932859 3.3085021972656246 ;
	setAttr ".sp" -type "double3" 1.1051161885261533 -1.7092640399932859 3.3085021972656246 ;
createNode mesh -n "polySurfaceShape12" -p "polySurface11";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.59638786315917969 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 5 ".uvst[0].uvsp[0:4]" -type "float2" 0.5135988 0.33101422
		 0.52020228 0.37470657 0.50152797 0.40037516 0.48285365 0.3747066 0.4894571 0.33101416;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.0062964801 0.012592971 
		0.007401966 -0.014079381 -0.0029728012 0.0017473733 -0.0014863987 -0.012592979 -0.0074019516 
		0.014079381 -0.0029728049 -0.007401966 0.011106589 0.012592979 0.0017473733 -1.8626451e-008 
		-1.5483238e-007 1.2805685e-009 1.44355e-008 -1.7881393e-007 6.0535967e-009 1.3969839e-009 
		-1.9930303e-007 -1.5366822e-008 9.3132257e-010 -1.5483238e-007 -6.0535967e-009 2.8871e-008 
		-1.6670674e-007 1.2805685e-009;
	setAttr -s 5 ".vt[0:4]"  1.31155252 -2.12213707 3.065821409 1.56672263 -1.61179781 3.25121284
		 1.15384924 -1.29639077 3.55118251 0.64350975 -1.61179769 3.55118299 0.74097568 -2.12213731 3.25121284;
	setAttr -s 5 ".ed[0:4]"  3 2 0 4 3 0 0 4 0 1 0 0 2 1 0;
	setAttr -ch 5 ".fc[0]" -type "polyFaces" 
		f 5 -4 -5 -1 -2 -3
		mu 0 5 0 1 2 3 4;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface12" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.048733055591583245 -3.9194960594177246 -1.4901161193847655e-008 ;
	setAttr ".sp" -type "double3" -0.048733055591583245 -3.9194960594177246 -1.4901161193847655e-008 ;
createNode mesh -n "polySurfaceShape13" -p "polySurface12";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.59638786315917969 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 5 ".uvst[0].uvsp[0:4]" -type "float2" 0.45556962 0.029231757
		 0.53966445 0.076375246 0.43126673 0.076375276 0.32286906 0.076375246 0.33987999 0.058413297;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.014079379 0 0.0091493316 
		-0.014079375 0 -0.0091493381 0.0033236945 0 -0.014803935 0.014079379 0 2.8742766e-009 
		0.0033236882 0 0.014803935 -1.1175871e-008 -5.9604645e-008 6.519258e-009 9.3132257e-009 
		-5.9604645e-008 3.7252903e-009 8.3819032e-009 -5.9604645e-008 1.8626451e-008 -9.3132257e-009 
		-5.9604645e-008 -9.0816243e-014 -4.4237822e-009 -5.9604645e-008 -1.8626451e-008;
	setAttr -s 5 ".vt[0:4]"  0.41287333 -3.91949606 -0.29996991 0.41287321 -3.91949606 0.29997009
		 -0.15770367 -3.91949606 0.48536164 -0.51033944 -3.91949606 -1.0913716e-007 -0.15770346 -3.91949606 -0.48536167;
	setAttr -s 5 ".ed[0:4]"  3 2 0 4 3 0 0 4 0 1 0 0 2 1 0;
	setAttr -ch 5 ".fc[0]" -type "polyFaces" 
		f 5 -4 -5 -1 -2 -3
		mu 0 5 0 1 2 3 4;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface14" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.752195805311203 3.7872791290283203 0.54655364551581442 ;
	setAttr ".sp" -type "double3" 0.752195805311203 3.7872791290283203 0.54655364551581442 ;
createNode mesh -n "polySurfaceShape15" -p "polySurface14";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.56321818 0.85199779
		 0.61246437 0.85199773 0.66415524 0.87668729 0.59462714 0.92314506 0.48633191 0.92314506
		 0.51152724 0.87668729;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.068261415 -0.037941478 
		0.15663001 0.17007211 -0.037941478 0.016499577 0.10067245 -0.00066276931 -0.13805357 
		-0.068353139 0.037941478 -0.15663001 -0.17007211 0.037941478 -0.01662581 -0.10017305 
		-0.00066276931 0.13838665;
	setAttr -s 6 ".vt[0:5]"  0.98861843 3.65586925 1.089039922 1.34123862 3.65586925 0.60369974
		 1.10087371 3.78498363 0.068406671 0.51545548 3.91868901 0.0040673693 0.16315299 3.91868901 0.48897034
		 0.40524757 3.78498363 1.02585423;
	setAttr -s 6 ".ed[0:5]"  0 5 0 1 0 0 2 1 0 3 2 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -2 -3 -4 -5 -6 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface15" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.75219553709030151 3.7872791290283203 -0.54655393469147384 ;
	setAttr ".sp" -type "double3" 0.75219553709030151 3.7872791290283203 -0.54655393469147384 ;
createNode mesh -n "polySurfaceShape16" -p "polySurface15";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.8367818 0.87668729
		 0.70411152 0.92314506 0.59581631 0.92314506 0.6841538 0.87668729 0.73584467 0.85199779
		 0.78509092 0.85199773;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.10017306 -0.00066276931 
		-0.13838659 -0.17007208 0.037941478 0.016625868 -0.068353057 0.037941478 0.15663002 
		0.10067253 -0.00066276931 0.13805357 0.17007208 -0.037941478 -0.016499631 0.068261385 
		-0.037941478 -0.15663002;
	setAttr -s 6 ".vt[0:5]"  0.40524727 3.78498363 -1.025854349 0.16315281 3.91868901 -0.48897043
		 0.51545548 3.91868901 -0.00406759 1.10087371 3.78498363 -0.068406969 1.34123826 3.65586925 -0.60370022
		 0.98861808 3.65586925 -1.089040279;
	setAttr -s 6 ".ed[0:5]"  3 2 0 0 5 0 1 0 0 2 1 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -3 -4 -1 -5 -6 -2
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface16" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.7404977679252625 3.4815421104431152 -2.6822090148925781e-007 ;
	setAttr ".sp" -type "double3" 1.7404977679252625 3.4815421104431152 -2.6822090148925781e-007 ;
createNode mesh -n "polySurfaceShape17" -p "polySurface16";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.70730871 0.80044574
		 0.7242344 0.8435328 0.67415452 0.86942601 0.62407458 0.8435328 0.64100039 0.80044574
		 0.67415452 0.7844162;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.076863497 -0.039960418 
		-0.15136427 -0.077379957 0.038918354 -0.15136133 -0.15217489 0.077819496 3.4239758e-008 
		-0.077379882 0.038918354 0.15136136 0.076863565 -0.039960418 0.15136427 0.15217489 
		-0.077819496 -7.5867295e-009;
	setAttr -s 6 ".vt[0:5]"  2.0067136288 3.34313965 -0.52424872 1.47249317 3.61633539 -0.52423853
		 1.21344173 3.75106907 -1.4963189e-007 1.47249341 3.61633539 0.52423811 2.0067138672 3.34313965 0.52424818
		 2.26755381 3.21201515 -2.9449745e-007;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -2 -1 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface17" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.6548840999603271 3.3097681999206543 1.2023431062698364 ;
	setAttr ".sp" -type "double3" 1.6548840999603271 3.3097681999206543 1.2023431062698364 ;
createNode mesh -n "polySurfaceShape18" -p "polySurface17";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.57253188 0.76060593
		 0.60315061 0.76060581 0.62579173 0.79569262 0.61246085 0.83990228 0.56322163 0.83990228
		 0.54989082 0.79569256;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.056065686 -0.081713028 
		0.14776899 0.15786198 -0.081713095 0.0076585035 0.097118661 0.00073319027 -0.13290152 
		-0.056065757 0.081713095 -0.14776899 -0.15786198 0.081713095 -0.007658469 -0.096385576 
		0.00073319027 0.13343427;
	setAttr -s 6 ".vt[0:5]"  1.84906697 3.026756048 1.71413934 2.20163727 3.02675581 1.22886825
		 1.9912535 3.3123076 0.74204022 1.46070099 3.59278059 0.69054687 1.10813093 3.59278059 1.17581809
		 1.32105374 3.3123076 1.66449118;
	setAttr -s 6 ".ed[0:5]"  4 3 0 3 2 0 0 5 0 1 0 0 2 1 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -5 -2 -1 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface18" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.6548835039138794 3.3097681999206543 -1.2023438811302185 ;
	setAttr ".sp" -type "double3" 1.6548835039138794 3.3097681999206543 -1.2023438811302185 ;
createNode mesh -n "polySurfaceShape19" -p "polySurface18";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.79841816 0.79569256
		 0.78508741 0.83990216 0.73584819 0.83990216 0.72251731 0.79569256 0.74515837 0.76060581
		 0.77577716 0.76060581;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.096385539 0.00073319027 
		-0.13343418 -0.15786193 0.081713095 0.0076585547 -0.056065653 0.081713095 0.14776905 
		0.097118765 0.00073319027 0.13290158 0.15786193 -0.081713028 -0.0076585207 0.05606572 
		-0.081713095 -0.14776905;
	setAttr -s 6 ".vt[0:5]"  1.32105327 3.3123076 -1.66449165 1.10813046 3.59278059 -1.17581856
		 1.46070075 3.59278059 -0.69054747 1.99125326 3.3123076 -0.74204075 2.20163655 3.026756048 -1.22886908
		 1.8490665 3.02675581 -1.7141403;
	setAttr -s 6 ".ed[0:5]"  2 1 0 3 2 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -1 -2 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface19" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.6097856760025024 2.8149776458740234 0.63222360610961914 ;
	setAttr ".sp" -type "double3" 2.6097856760025024 2.8149776458740234 0.63222360610961914 ;
createNode mesh -n "polySurfaceShape20" -p "polySurface19";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.66840518 0.72123522
		 0.66771793 0.76677012 0.63525093 0.78468347 0.6103726 0.75219828 0.62120646 0.70971406
		 0.64614666 0.69588834;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.079700865 -0.041409798 
		-0.14949039 -0.04788629 0.075731859 -0.14554045 -0.12863421 0.11774413 0.0018738997 
		-0.079696804 0.041406631 0.14949039 0.048669662 -0.074893758 0.14573449 0.12863421 
		-0.11774413 -0.0018709225;
	setAttr -s 6 ".vt[0:5]"  2.88582873 2.67155528 0.11446536 2.44393206 3.077274084 0.12814592
		 2.16426253 3.22278309 0.63871384 2.33375669 2.95838904 1.14998186 2.7783525 2.55558395 1.13697338
		 3.055308819 2.4071722 0.62574369;
	setAttr -s 6 ".ed[0:5]"  2 1 0 3 2 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -1 -2 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface20" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.6097853183746338 2.8149776458740234 -0.63222413510084152 ;
	setAttr ".sp" -type "double3" 2.6097853183746338 2.8149776458740234 -0.63222413510084152 ;
createNode mesh -n "polySurfaceShape21" -p "polySurface20";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.72710258 0.70971411
		 0.7379365 0.75219834 0.71305817 0.78468347 0.68059105 0.76677012 0.67990392 0.72123522
		 0.70216227 0.69588834;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.048669625 -0.074893691 
		-0.14573444 -0.079696909 0.041406631 -0.14949043 -0.12863424 0.11774413 -0.001873919 
		-0.047886185 0.075731859 0.1455404 0.079700969 -0.041409798 0.14949043 0.12863424 
		-0.11774413 0.0018709548;
	setAttr -s 6 ".vt[0:5]"  2.77835202 2.55558419 -1.13697374 2.33375597 2.95838904 -1.14998257
		 2.16426206 3.22278309 -0.63871443 2.44393206 3.077274084 -0.12814659 2.88582873 2.67155528 -0.1144657
		 3.05530858 2.4071722 -0.6257441;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface21" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.4040648341178894 2.5252423286437988 1.7451988458633423 ;
	setAttr ".sp" -type "double3" 2.4040648341178894 2.5252423286437988 1.7451988458633423 ;
createNode mesh -n "polySurfaceShape22" -p "polySurface21";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.57578176 0.66948253
		 0.5999006 0.66948253 0.61500663 0.7065621 0.60315281 0.74850875 0.57252961 0.74850881
		 0.5606758 0.7065621;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.029921422 -0.11480489 0.12911326 
		0.13164033 -0.11480489 -0.010890915 0.099844202 5.0251515e-006 -0.13822013 -0.029829627 
		0.11480489 -0.12830228 -0.13164033 0.11480489 0.01182814 -0.1010014 5.0251515e-006 
		0.13822013;
	setAttr -s 6 ".vt[0:5]"  2.50769734 2.12761688 2.19238114 2.85999966 2.12761688 1.70747828
		 2.74987411 2.52525973 1.26647496 2.30075026 2.92286777 1.30082536 1.94813001 2.92286777 1.78616548
		 2.054247618 2.52525973 2.22392273;
	setAttr -s 6 ".ed[0:5]"  4 3 0 3 2 0 0 5 0 1 0 0 2 1 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -5 -2 -1 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface22" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.4040645360946655 2.5252423286437988 -1.7451995611190796 ;
	setAttr ".sp" -type "double3" 2.4040645360946655 2.5252423286437988 -1.7451995611190796 ;
createNode mesh -n "polySurfaceShape23" -p "polySurface22";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.78763324 0.7065621
		 0.77577931 0.74850881 0.74515629 0.74850881 0.73330235 0.7065621 0.74840838 0.66948253
		 0.77252716 0.66948253;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.10100146 5.0251515e-006 
		-0.13822013 -0.13164042 0.11480489 -0.011828209 -0.029829748 0.11480489 0.1283022 
		0.099844158 5.0251515e-006 0.13822013 0.13164042 -0.11480489 0.010890984 0.02992144 
		-0.11480482 -0.12911318;
	setAttr -s 6 ".vt[0:5]"  2.054247141 2.52525973 -2.22392344 1.94812942 2.92286777 -1.78616643
		 2.30074954 2.92286777 -1.30082631 2.74987364 2.52525973 -1.26647568 2.85999966 2.12761688 -1.70747876
		 2.50769711 2.12761712 -2.19238162;
	setAttr -s 6 ".ed[0:5]"  2 1 0 3 2 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -1 -2 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface23" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.1551216840744019 1.9499723315238953 1.2002679705619812 ;
	setAttr ".sp" -type "double3" 3.1551216840744019 1.9499723315238953 1.2002679705619812 ;
createNode mesh -n "polySurfaceShape24" -p "polySurface23";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.64675587 0.63917917
		 0.64410108 0.68447262 0.61946058 0.69991153 0.60016549 0.66908711 0.60676271 0.62543595
		 0.6284014 0.61206317;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.084291652 -0.04971553 -0.14527036 
		-0.0067705661 0.097626321 -0.14527048 -0.089820832 0.14533326 -0.0006351482 -0.083592951 
		0.050055761 0.14527048 0.0073872828 -0.097153343 0.14527048 0.089820832 -0.14533326 
		-0.00063504494;
	setAttr -s 6 ".vt[0:5]"  3.44706488 1.77778316 0.69712573 3.13167191 2.2881 0.69712532
		 2.84402823 2.45333242 1.19806814 2.86559844 2.12333989 1.70341063 3.18070745 1.61348283 1.70341063
		 3.46621513 1.44661224 1.1980685;
	setAttr -s 6 ".ed[0:5]"  2 1 0 3 2 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -1 -2 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface24" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.3123072385787964 2.0471186637878418 0 ;
	setAttr ".sp" -type "double3" 3.3123072385787964 2.0471186637878418 0 ;
createNode mesh -n "polySurfaceShape25" -p "polySurface24";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.69511652 0.64028507
		 0.69777101 0.68557203 0.67415452 0.70772481 0.65053791 0.68557203 0.65319246 0.64028507
		 0.67415452 0.62163877;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.044791553 -0.074113555 
		-0.15542744 -0.046257794 0.073207304 -0.15542755 -0.086537756 0.14002104 -2.9750876e-008 
		-0.046257794 0.073207304 0.15542746 0.044791553 -0.074113585 0.15542755 0.086537756 
		-0.14002104 3.7029217e-008;
	setAttr -s 6 ".vt[0:5]"  3.46744227 1.79042721 -0.5383212 3.15209389 2.30067134 -0.53832155
		 3.012584686 2.53207994 -1.0304182e-007 3.15209389 2.30067134 0.53832126 3.46744227 1.79042709 0.53832155
		 3.61202979 1.56215739 1.2825028e-007;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface25" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.1551215648651123 1.9499725103378296 -1.2002682089805603 ;
	setAttr ".sp" -type "double3" 3.1551215648651123 1.9499725103378296 -1.2002682089805603 ;
createNode mesh -n "polySurfaceShape26" -p "polySurface25";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.74154627 0.62543595
		 0.74814355 0.66908711 0.72884834 0.69991153 0.70420796 0.68447262 0.70155317 0.63917917
		 0.71990758 0.61206317;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.0073873173 -0.097153358 
		-0.14527041 -0.083592914 0.050055709 -0.14527051 -0.089820869 0.1453332 0.0006351138 
		-0.0067705316 0.097626269 0.14527044 0.084291756 -0.049715545 0.14527051 0.089820869 
		-0.1453332 0.0006351826;
	setAttr -s 6 ".vt[0:5]"  3.18070745 1.61348295 -1.70341063 2.86559844 2.12333989 -1.70341098
		 2.844028 2.45333242 -1.1980685 3.13167191 2.2881 -0.69712567 3.44706511 1.77778327 -0.69712543
		 3.46621513 1.4466126 -1.19806826;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface26" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.2876436710357666 3.7872791290283203 -0.88420742750167847 ;
	setAttr ".sp" -type "double3" -0.2876436710357666 3.7872791290283203 -0.88420742750167847 ;
createNode mesh -n "polySurfaceShape27" -p "polySurface26";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.79326111 0.91771799
		 0.64691532 0.94120717 0.70530063 0.92314506 0.85678035 0.87668729 0.90847117 0.85199773
		 0.93309426 0.89527416;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.16248748 -0.00066276931 
		0.052486934 -0.03666183 0.037941478 0.16686635 0.12792294 0.037941478 0.11338947 
		0.16248748 -0.00066276931 -0.05310386 0.036944292 -0.037941478 -0.16686635 -0.12778889 
		-0.037941478 -0.11334128;
	setAttr -s 6 ".vt[0:5]"  -0.8504172 3.78498363 -0.70241952 -0.4146215 3.91868901 -0.30626774
		 0.155416 3.91868901 -0.49148428 0.27512985 3.78498363 -1.068132043 -0.15968753 3.65586925 -1.46214712
		 -0.73023903 3.65586925 -1.27676368;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -2 -1 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface27" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.53757167235016823 3.4815421104431152 -1.6553117632865906 ;
	setAttr ".sp" -type "double3" 0.53757167235016823 3.4815421104431152 -1.6553117632865906 ;
createNode mesh -n "polySurfaceShape28" -p "polySurface27";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.8799352 0.80044574
		 0.8968609 0.8435328 0.84678108 0.86942601 0.79670113 0.8435328 0.81362683 0.80044574
		 0.84678096 0.7844162;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.12012546 -0.039960418 
		-0.11987563 -0.16778651 0.038918354 0.026819458 -0.046946216 0.077819496 0.14472693 
		0.12011988 0.038918354 0.1203659 0.16778651 -0.039960418 -0.026327441 0.047102999 
		-0.077819496 -0.14472693;
	setAttr -s 6 ".vt[0:5]"  0.12151849 3.34313965 -2.070499659 -0.043555014 3.61633539 -1.56242287
		 0.37497398 3.75106907 -1.15405166 0.95360553 3.61633539 -1.23842585 1.11869836 3.34313965 -1.74649656
		 0.70071238 3.21201515 -2.15657187;
	setAttr -s 6 ".ed[0:5]"  3 2 0 4 3 0 2 1 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -3 -1 -2 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface28" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.63259462639689445 3.3097681999206543 -1.9454323649406433 ;
	setAttr ".sp" -type "double3" -0.63259462639689445 3.3097681999206543 -1.9454323649406433 ;
createNode mesh -n "polySurfaceShape29" -p "polySurface28";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.93309426 0.82359469
		 0.93309426 0.8486681 0.90847462 0.83990216 0.89514381 0.79569256 0.91778499 0.76060593
		 0.93309426 0.80531728;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.15654823 0.00073319027 
		0.050434642 -0.041358311 0.081713095 0.15250222 0.12335146 0.081713095 0.098984733 
		0.15654823 0.00073319027 -0.051296629 0.041638333 -0.081713028 -0.15250222 -0.12307146 
		-0.081713095 -0.098984838;
	setAttr -s 6 ".vt[0:5]"  -1.17479765 3.3123076 -1.77075255 -0.77583867 3.59278059 -1.41724265
		 -0.20536822 3.59278059 -1.60259986 -0.090391599 3.3123076 -2.12309766 -0.48838073 3.026756048 -2.47362208
		 -1.058851242 3.02675581 -2.28826523;
	setAttr -s 6 ".ed[0:5]"  2 1 0 3 2 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -1 -2 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface29" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.4084874093532562 2.8149776458740234 -2.2866841554641724 ;
	setAttr ".sp" -type "double3" 1.4084874093532562 2.8149776458740234 -2.2866841554641724 ;
createNode mesh -n "polySurfaceShape30" -p "polySurface29";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.84103161 0.72123528
		 0.84034437 0.76677012 0.80787742 0.78468347 0.7829991 0.75219834 0.79383296 0.70971411
		 0.81877321 0.69588834;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.11775819 -0.041409727 
		-0.12199564 -0.15342818 0.075731859 0.00056760124 -0.038181335 0.11774413 0.12291703 
		0.11733279 0.041406631 0.12199076 0.15342818 -0.074893758 -0.0012536377 0.037757482 
		-0.11774413 -0.12291703;
	setAttr -s 6 ".vt[0:5]"  1.00063323975 2.67155552 -2.70921469 0.87709063 3.077274084 -2.28471828
		 1.27624679 3.22278309 -1.86096239 1.81486821 2.95838904 -1.86417055 1.93988419 2.55558395 -2.29102612
		 1.53926003 2.4071722 -2.71240592;
	setAttr -s 6 ".ed[0:5]"  3 2 0 4 3 0 2 1 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -3 -1 -2 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface30" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.20518931746482849 2.8149776458740234 -2.6774230003356934 ;
	setAttr ".sp" -type "double3" 0.20518931746482849 2.8149776458740234 -2.6774230003356934 ;
createNode mesh -n "polySurfaceShape31" -p "polySurface30";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.89972913 0.70971417
		 0.91056299 0.75219834 0.88568455 0.78468347 0.85321754 0.76677012 0.85253042 0.72123528
		 0.87478882 0.69588834;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.12356257 -0.074893691 
		-0.091321528 -0.16680215 0.041406631 0.029601654 -0.041532982 0.11774413 0.12175984 
		0.12361888 0.075731859 0.090517439 0.16680215 -0.041409727 -0.029604545 0.04152891 
		-0.11774413 -0.12175984;
	setAttr -s 6 ".vt[0:5]"  -0.22276823 2.55558419 -2.99371409 -0.37252808 2.95838904 -2.574898
		 0.061340302 3.22278309 -2.25570917 0.63334191 3.077274084 -2.36391687 0.78290671 2.67155552 -2.77995801
		 0.34902424 2.4071722 -3.099136829;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface31" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.91750587522983551 2.5252423286437988 -2.826198935508728 ;
	setAttr ".sp" -type "double3" -0.91750587522983551 2.5252423286437988 -2.826198935508728 ;
createNode mesh -n "polySurfaceShape32" -p "polySurface31";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.93309426 0.72766399
		 0.93309426 0.75251937 0.91778278 0.74850881 0.90592885 0.7065621 0.92304999 0.72049975
		 0.93309426 0.71536028;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.16248752 5.0251515e-006 
		0.053490501 -0.051749595 0.11480489 0.12168718 0.11298357 0.11480489 0.068162084 
		0.16248752 5.0251515e-006 -0.052100327 0.05121585 -0.11480482 -0.12168718 -0.11336894 
		-0.11480489 -0.068210341;
	setAttr -s 6 ".vt[0:5]"  -1.48027956 2.52525973 -2.64093518 -1.096740007 2.92286777 -2.40473676
		 -0.52618855 2.92286777 -2.59012032 -0.35473219 2.52525973 -3.0066478252 -0.74012035 2.12761712 -3.24766111
		 -1.3101579 2.12761688 -3.062444687;
	setAttr -s 6 ".ed[0:5]"  2 1 0 3 2 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -1 -2 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface32" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.1168391704559326 1.9499723315238953 -2.6309467554092407 ;
	setAttr ".sp" -type "double3" 2.1168391704559326 1.9499723315238953 -2.6309467554092407 ;
createNode mesh -n "polySurfaceShape33" -p "polySurface32";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.81938243 0.63917917
		 0.81672758 0.68447256 0.79208714 0.69991153 0.77279204 0.66908705 0.77938926 0.62543595
		 0.80102789 0.61206317;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.11220809 -0.049715564 
		-0.12472492 -0.14034794 0.097626321 -0.038119595 -0.028455576 0.14533326 0.085560746 
		0.11223346 0.050055761 0.12472492 0.14034794 -0.097153343 0.038197659 0.027056862 
		-0.14533326 -0.085288629;
	setAttr -s 6 ".vt[0:5]"  1.72820771 1.77778304 -3.062930107 1.63074565 2.2881 -2.76297355
		 2.018283606 2.45333242 -2.33460808 2.50555849 2.12333989 -2.1989634 2.60293269 1.61348283 -2.4986496
		 2.21055031 1.44661224 -2.92634296;
	setAttr -s 6 ".ed[0:5]"  3 2 0 4 3 0 2 1 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -3 -1 -2 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface33" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.0227745920419693 2.0471186637878418 -3.1477766036987305 ;
	setAttr ".sp" -type "double3" 1.0227745920419693 2.0471186637878418 -3.1477766036987305 ;
createNode mesh -n "polySurfaceShape34" -p "polySurface33";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.86774307 0.64028507
		 0.87039763 0.68557209 0.84678096 0.70772481 0.82316452 0.68557203 0.82581896 0.64028507
		 0.84678096 0.62163877;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.13375242 -0.074113585 
		-0.091326214 -0.16188829 0.073207304 -0.0047332109 -0.026515113 0.14002104 0.081605025 
		0.13375239 0.073207304 0.091326214 0.16188829 -0.074113622 0.0047332109 0.026968196 
		-0.14002104 -0.082999535;
	setAttr -s 6 ".vt[0:5]"  0.5595246 1.79042709 -3.46408391 0.46207634 2.30067134 -3.16417003
		 0.93093979 2.53207994 -2.86513853 1.4860245 2.30067134 -2.8314693 1.58347285 1.79042697 -3.13138318
		 1.11617863 1.56215739 -3.43524456;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface34" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.16616278886795044 1.9499725103378296 -3.3709224462509155 ;
	setAttr ".sp" -type "double3" -0.16616278886795044 1.9499725103378296 -3.3709224462509155 ;
createNode mesh -n "polySurfaceShape35" -p "polySurface34";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.90406531 0.67201495
		 0.91376865 0.68650383 0.90147483 0.69991153 0.87683445 0.68447262 0.87417966 0.63917917
		 0.89253396 0.61206317;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.13598551 -0.097153358 
		-0.05211306 -0.16410008 0.050055709 0.03441434 -0.027260123 0.1453332 0.085424721 
		0.13596021 0.097626269 0.051133912 0.16410008 -0.049715545 -0.03547141 0.0282523 
		-0.1453332 -0.085424721;
	setAttr -s 6 ".vt[0:5]"  -0.63714707 1.61348295 -3.55141544 -0.73452157 2.12333989 -3.25172877
		 -0.26057792 2.45333242 -3.075054884 0.30473387 2.2881 -3.19382071 0.40219599 1.77778327 -3.49377728
		 -0.068311267 1.4466126 -3.66679001;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface35" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.92966686189174652 3.7872791290283203 8.9406967163085938e-008 ;
	setAttr ".sp" -type "double3" -0.92966686189174652 3.7872791290283203 8.9406967163085938e-008 ;
createNode mesh -n "polySurfaceShape36" -p "polySurface35";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.31890208 0.87668729
		 0.37565845 0.92314506 0.26736325 0.92314506 0.16627415 0.87668729 0.21796505 0.85199773
		 0.26721126 0.85199773;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.00033699925 -0.00066276931 
		0.17084944 0.14732654 0.037941478 0.08652734 0.14732651 0.037941478 -0.086527348 
		-0.00033703365 -0.00066276931 -0.17084944 -0.14732654 -0.037941478 -0.086605303 -0.14732654 
		-0.037941478 0.086605407;
	setAttr -s 6 ".vt[0:5]"  -0.93083405 3.78498363 0.59173518 -0.41940305 3.91868901 0.29968655
		 -0.41940314 3.91868901 -0.2996864 -0.93083417 3.78498363 -0.59173501 -1.43993068 3.65586925 -0.29995641
		 -1.43993068 3.65586925 0.29995695;
	setAttr -s 6 ".ed[0:5]"  2 1 0 3 2 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -1 -2 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface36" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.4073718786239624 3.4815421104431152 -1.022517204284668 ;
	setAttr ".sp" -type "double3" -1.4073718786239624 3.4815421104431152 -1.022517204284668 ;
createNode mesh -n "polySurfaceShape37" -p "polySurface36";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.18942906 0.80044574
		 0.20635478 0.8435328 0.1562749 0.86942601 0.10619496 0.8435328 0.12312074 0.80044574
		 0.15627487 0.7844162;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.1513616 -0.039960418 0.077126458 
		-0.02657431 0.038918354 0.16778609 0.12290406 0.077819496 0.089295566 0.1513616 0.038918354 
		-0.077121727 0.026577752 -0.039960418 -0.16778609 -0.12332008 -0.077819496 -0.089596696;
	setAttr -s 6 ".vt[0:5]"  -1.93161106 3.34313965 -0.75539058 -1.4994117 3.61633539 -0.44139194
		 -0.98169506 3.75106907 -0.71324301 -0.8831327 3.61633539 -1.28962743 -1.31532013 3.34313965 -1.60364246
		 -1.83448958 3.21201515 -1.33283436;
	setAttr -s 6 ".ed[0:5]"  3 2 0 4 3 0 2 1 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -3 -1 -2 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface37" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.0455489754676819 3.3097681999206543 3.2782554626464844e-007 ;
	setAttr ".sp" -type "double3" -2.0455489754676819 3.3097681999206543 3.2782554626464844e-007 ;
createNode mesh -n "polySurfaceShape38" -p "polySurface37";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.28053859 0.79569256
		 0.26720774 0.83990216 0.21796857 0.83990228 0.20463769 0.79569256 0.22727875 0.76060593
		 0.25789756 0.76060581;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.00045314134 0.00073319027 
		0.16460454 0.13221455 0.081713095 0.086593054 0.13221455 0.081713095 -0.086593069 
		-0.00045314134 0.00073319027 -0.16460454 -0.13221455 -0.081713028 -0.08659301 -0.13221455 
		-0.081713095 0.086593106;
	setAttr -s 6 ".vt[0:5]"  -2.047118425 3.3123076 0.57010633 -1.58762538 3.59278059 0.29991439
		 -1.58762538 3.59278059 -0.29991379 -2.047118425 3.3123076 -0.57010567 -2.50347257 3.026756048 -0.29991359
		 -2.50347257 3.02675581 0.29991457;
	setAttr -s 6 ".ed[0:5]"  2 1 0 3 2 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -1 -2 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface38" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.7397547960281372 2.8149776458740234 -2.0465424060821533 ;
	setAttr ".sp" -type "double3" -1.7397547960281372 2.8149776458740234 -2.0465424060821533 ;
createNode mesh -n "polySurfaceShape39" -p "polySurface38";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.15052547 0.72123522
		 0.14983831 0.76677012 0.11737131 0.78468347 0.092492923 0.75219828 0.10332681 0.70971411
		 0.12826709 0.6958884;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.15234597 -0.041409798 
		0.074401982 -0.046804089 0.075731859 0.14620025 0.10517037 0.11774413 0.074402019 
		0.15234597 0.041406631 -0.073786922 0.046287637 -0.074893758 -0.14620025 -0.10516531 
		-0.11774413 -0.073786922;
	setAttr -s 6 ".vt[0:5]"  -2.26740336 2.67155528 -1.78885198 -1.90186024 3.077274084 -1.54017949
		 -1.37549841 3.22278309 -1.78885186 -1.21210623 2.95838904 -2.30210257 -1.57943809 2.55558395 -2.55290532
		 -2.10399365 2.4071722 -2.30210257;
	setAttr -s 6 ".ed[0:5]"  3 2 0 4 3 0 2 1 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -3 -1 -2 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface39" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.4842677116394043 2.8149776458740234 -1.0225173830986023 ;
	setAttr ".sp" -type "double3" -2.4842677116394043 2.8149776458740234 -1.0225173830986023 ;
createNode mesh -n "polySurfaceShape40" -p "polySurface39";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.20922296 0.70971417
		 0.22005688 0.75219834 0.19517846 0.78468347 0.16271143 0.76677012 0.1620243 0.72123522
		 0.18428268 0.69588834;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.12466121 -0.074893691 
		0.089295551 -0.023018224 0.041406631 0.16778615 0.10333969 0.11774413 0.07712651 
		0.12466121 0.075731859 -0.089596651 0.023762703 -0.041409798 -0.16778615 -0.10259364 
		-0.11774413 -0.077121712;
	setAttr -s 6 ".vt[0:5]"  -2.91603041 2.55558419 -0.71324325 -2.56399107 2.95838904 -0.44139194
		 -2.12635183 3.22278309 -0.75539058 -2.052505016 3.077274084 -1.33283436 -2.40196586 2.67155528 -1.60364282
		 -2.83959961 2.4071722 -1.28962755;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface40" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.9716856479644775 2.5252423286437988 3.8743019104003906e-007 ;
	setAttr ".sp" -type "double3" -2.9716856479644775 2.5252423286437988 3.8743019104003906e-007 ;
createNode mesh -n "polySurfaceShape41" -p "polySurface40";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.26975352 0.7065621
		 0.2578997 0.74850881 0.22727661 0.74850881 0.21542273 0.7065621 0.23052873 0.66948253
		 0.25464752 0.66948247;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.00074358477 5.0251515e-006 
		0.17084947 0.099822365 0.11480489 0.086605392 0.099822365 0.11480489 -0.086605325 
		0.00074358477 5.0251515e-006 -0.17084947 -0.099822365 -0.11480482 -0.08652737 -0.099822298 
		-0.11480489 0.08652731;
	setAttr -s 6 ".vt[0:5]"  -2.96911025 2.52525973 0.5917356 -2.62595201 2.92286777 0.29995719
		 -2.62595201 2.92286777 -0.29995617 -2.96911025 2.52525973 -0.59173483 -3.31741929 2.12761712 -0.29968619
		 -3.31741905 2.12761688 0.29968676;
	setAttr -s 6 ".ed[0:5]"  2 1 0 3 2 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -1 -2 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface41" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.8480260968208313 1.94997239112854 -2.8261990547180176 ;
	setAttr ".sp" -type "double3" -1.8480260968208313 1.94997239112854 -2.8261990547180176 ;
createNode mesh -n "polySurfaceShape42" -p "polySurface41";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.12887625 0.63917917
		 0.1262214 0.68447256 0.10158099 0.69991153 0.082285836 0.66908711 0.088883087 0.62543595
		 0.11052175 0.61206317;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.15329857 -0.049715582 
		0.068162054 -0.079627708 0.097626306 0.12168714 0.072575912 0.14533325 0.053490538 
		0.15329857 0.050055742 -0.068210311 0.079694033 -0.097153358 -0.12168714 -0.072757229 
		-0.14533325 -0.05210029;
	setAttr -s 6 ".vt[0:5]"  -2.37897396 1.77778304 -2.59012055 -2.12381577 2.2881 -2.404737
		 -1.59666026 2.45333242 -2.64093518 -1.31707823 2.12333989 -3.062444687 -1.5720067 1.61348283 -3.24766111
		 -2.10001993 1.44661236 -3.0066478252;
	setAttr -s 6 ".ed[0:5]"  3 2 0 4 3 0 2 1 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -3 -1 -2 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface42" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.6776586771011353 2.047118604183197 -1.9454327821731567 ;
	setAttr ".sp" -type "double3" -2.6776586771011353 2.047118604183197 -1.9454327821731567 ;
createNode mesh -n "polySurfaceShape43" -p "polySurface42";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.17723693 0.64028507
		 0.17989139 0.68557203 0.15627487 0.70772481 0.13265835 0.68557209 0.13531281 0.64028507
		 0.15627487 0.62163877;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.12818821 -0.074113533 
		0.098984718 -0.054527748 0.073207319 0.15250224 0.069417343 0.14002106 0.050434694 
		0.12818821 0.073207319 -0.098984785 0.054527748 -0.074113607 -0.15250224 -0.070603624 
		-0.14002106 -0.051296577;
	setAttr -s 6 ".vt[0:5]"  -3.12163711 1.79042721 -1.60260034 -2.86651492 2.30067134 -1.417243
		 -2.43723249 2.53207994 -1.77075279 -2.23368025 2.30067134 -2.28826547 -2.48880243 1.79042697 -2.47362256
		 -2.92219353 1.56215727 -2.1230979;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface43" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.2589111328125 1.9499725103378296 -0.88420771062374115 ;
	setAttr ".sp" -type "double3" -3.2589111328125 1.9499725103378296 -0.88420771062374115 ;
createNode mesh -n "polySurfaceShape44" -p "polySurface43";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.22366665 0.62543595
		 0.2302639 0.66908711 0.21096878 0.69991153 0.18632831 0.68447262 0.18367346 0.63917917
		 0.20202796 0.61206317;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.091114812 -0.097153358 
		0.11338944 -0.017510245 0.050055709 0.16686636 0.073289432 0.1453332 0.052486949 
		0.091114812 0.097626269 -0.11334127 0.017443884 -0.049715545 -0.16686636 -0.072043814 
		-0.1453332 -0.053103879;
	setAttr -s 6 ".vt[0:5]"  -3.57448626 1.61348295 -0.49148467 -3.31955767 2.12333989 -0.30626795
		 -3.0050740242 2.45333242 -0.70241976 -2.94333601 2.2881 -1.27676392 -3.19849443 1.77778327 -1.46214747
		 -3.50843406 1.4466126 -1.068132401;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface44" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.28764346241950989 3.7872791290283203 0.88420757651329041 ;
	setAttr ".sp" -type "double3" -0.28764346241950989 3.7872791290283203 0.88420757651329041 ;
createNode mesh -n "polySurfaceShape45" -p "polySurface44";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.49152869 0.87668723
		 0.48514277 0.92314506 0.37684757 0.92314506 0.33890069 0.87668729 0.39059159 0.85199779
		 0.43983778 0.85199773;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.16248748 -0.00066276931 
		0.053103816 0.12792294 0.037941478 -0.11338954 -0.036661856 0.037941478 -0.16686633 
		-0.16248748 -0.00066276931 -0.052486908 -0.12778881 -0.037941478 0.11334127 0.036944374 
		-0.037941478 0.16686633;
	setAttr -s 6 ".vt[0:5]"  0.27513009 3.78498363 1.068132043 0.15541619 3.91868901 0.49148419
		 -0.41462138 3.91868901 0.30626792 -0.85041702 3.78498363 0.70241976 -0.73023856 3.65586925 1.2767638
		 -0.15968704 3.65586925 1.46214724;
	setAttr -s 6 ".ed[0:5]"  1 0 0 2 1 0 3 2 0 0 5 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -2 -3 -5 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface45" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.4073717296123505 3.4815421104431152 1.0225176215171814 ;
	setAttr ".sp" -type "double3" -1.4073717296123505 3.4815421104431152 1.0225176215171814 ;
createNode mesh -n "polySurfaceShape46" -p "polySurface45";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.36205557 0.80044574
		 0.37898135 0.8435328 0.32890141 0.86942601 0.27882153 0.8435328 0.29574719 0.80044574
		 0.32890141 0.7844162;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.026577812 -0.039960418 
		0.16778608 0.15136164 0.038918354 0.077121675 0.12290405 0.077819496 -0.089295603 
		-0.026574353 0.038918354 -0.16778608 -0.15136164 -0.039960418 -0.077126443 -0.12332009 
		-0.077819496 0.089596719;
	setAttr -s 6 ".vt[0:5]"  -1.31531978 3.34313965 1.60364282 -0.8831324 3.61633539 1.28962767
		 -0.98169494 3.75106907 0.71324331 -1.4994117 3.61633539 0.44139242 -1.93161106 3.34313965 0.75539106
		 -1.83448946 3.21201515 1.33283484;
	setAttr -s 6 ".ed[0:5]"  3 2 0 4 3 0 2 1 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -3 -1 -2 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface46" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.63259404525160789 3.3097681999206543 1.9454327821731567 ;
	setAttr ".sp" -type "double3" -0.63259404525160789 3.3097681999206543 1.9454327821731567 ;
createNode mesh -n "polySurfaceShape47" -p "polySurface46";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.45316511 0.79569256
		 0.43983424 0.83990216 0.39059508 0.83990228 0.37726417 0.79569256 0.39990526 0.76060581
		 0.43052405 0.76060581;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.15654826 0.00073319027 
		0.051296506 0.12335146 0.081713095 -0.098984815 -0.041358341 0.081713095 -0.15250224 
		-0.15654826 0.00073319027 -0.05043466 -0.12307135 -0.081713028 0.098984785 0.041638415 
		-0.081713095 0.15250224;
	setAttr -s 6 ".vt[0:5]"  -0.090390913 3.3123076 2.12309766 -0.20536765 3.59278059 1.60259998
		 -0.7758382 3.59278059 1.417243 -1.17479718 3.3123076 1.77075291 -1.058850288 3.026756048 2.28826547
		 -0.48837987 3.02675581 2.47362256;
	setAttr -s 6 ".ed[0:5]"  2 1 0 3 2 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -1 -2 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface47" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.4842677116394043 2.8149776458740234 1.0225179195404053 ;
	setAttr ".sp" -type "double3" -2.4842677116394043 2.8149776458740234 1.0225179195404053 ;
createNode mesh -n "polySurfaceShape48" -p "polySurface47";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.32315195 0.72123528
		 0.32246485 0.76677012 0.28999782 0.78468347 0.26511943 0.75219834 0.27595335 0.70971406
		 0.3008936 0.69588834;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.023762772 -0.041409798 
		0.16778606 0.12466128 0.075731859 0.089596666 0.10333969 0.11774413 -0.07712651 -0.023018293 
		0.041406631 -0.16778606 -0.12466128 -0.074893758 -0.089295566 -0.10259364 -0.11774413 
		0.07712169;
	setAttr -s 6 ".vt[0:5]"  -2.40196562 2.67155528 1.60364306 -2.052504778 3.077274084 1.33283496
		 -2.12635183 3.22278309 0.75539112 -2.56399131 2.95838904 0.44139278 -2.91603065 2.55558395 0.71324372
		 -2.83959961 2.4071722 1.28962803;
	setAttr -s 6 ".ed[0:5]"  3 2 0 4 3 0 2 1 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -3 -1 -2 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface48" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.7397544980049133 2.8149776458740234 2.0465425848960876 ;
	setAttr ".sp" -type "double3" -1.7397544980049133 2.8149776458740234 2.0465425848960876 ;
createNode mesh -n "polySurfaceShape49" -p "polySurface48";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.38184947 0.70971417
		 0.39268336 0.75219834 0.367805 0.78468347 0.335338 0.76677012 0.33465081 0.72123522
		 0.35690916 0.69588834;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.046287652 -0.074893691 
		0.14620019 0.15234606 0.041406631 0.073786937 0.10517038 0.11774413 -0.074401967 
		-0.046804074 0.075731859 -0.14620019 -0.15234606 -0.041409798 -0.074401967 -0.10516533 
		-0.11774413 0.073786937;
	setAttr -s 6 ".vt[0:5]"  -1.57943773 2.55558419 2.55290532 -1.21210563 2.95838904 2.3021028
		 -1.37549806 3.22278309 1.78885221 -1.90185988 3.077274084 1.54017985 -2.26740336 2.67155528 1.78885221
		 -2.10399342 2.4071722 2.3021028;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface49" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.91750521957874298 2.5252423286437988 2.8261992931365967 ;
	setAttr ".sp" -type "double3" -0.91750521957874298 2.5252423286437988 2.8261992931365967 ;
createNode mesh -n "polySurfaceShape50" -p "polySurface49";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.4423801 0.7065621
		 0.43052623 0.74850881 0.39990312 0.74850881 0.38804924 0.7065621 0.40315527 0.66948253
		 0.42727408 0.66948253;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.16248751 5.0251515e-006 
		0.05210029 0.11298366 0.11480489 -0.068162121 -0.051749509 0.11480489 -0.12168714 
		-0.16248751 5.0251515e-006 -0.053490538 -0.11336899 -0.11480482 0.068210311 0.051215801 
		-0.11480489 0.12168714;
	setAttr -s 6 ".vt[0:5]"  -0.35473159 2.52525973 3.0066480637 -0.5261876 2.92286777 2.59012055
		 -1.096739054 2.92286777 2.40473723 -1.48027885 2.52525973 2.64093542 -1.31015742 2.12761712 3.062444925
		 -0.74011987 2.12761688 3.24766135;
	setAttr -s 6 ".ed[0:5]"  2 1 0 3 2 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -1 -2 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface50" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.2589111328125 1.9499723315238953 0.88420790433883667 ;
	setAttr ".sp" -type "double3" -3.2589111328125 1.9499723315238953 0.88420790433883667 ;
createNode mesh -n "polySurfaceShape51" -p "polySurface50";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.30150279 0.63917911
		 0.29884791 0.68447262 0.2742075 0.69991153 0.25491238 0.66908705 0.2615096 0.62543595
		 0.28314829 0.61206317;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.017443884 -0.049715564 
		0.16686627 0.091114812 0.097626321 0.11334132 0.073289432 0.14533326 -0.052486885 
		-0.017510245 0.050055761 -0.16686627 -0.091114812 -0.097153343 -0.11338949 -0.072043814 
		-0.14533326 0.053103823;
	setAttr -s 6 ".vt[0:5]"  -3.19849443 1.77778304 1.46214736 -2.94333601 2.2881 1.27676427
		 -3.0050740242 2.45333242 0.70242018 -3.31955767 2.12333989 0.30626845 -3.57448626 1.61348283 0.49148467
		 -3.50843406 1.44661224 1.068132401;
	setAttr -s 6 ".ed[0:5]"  3 2 0 4 3 0 2 1 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -3 -1 -2 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface51" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.6776587963104248 2.0471186637878418 1.9454327821731567 ;
	setAttr ".sp" -type "double3" -2.6776587963104248 2.0471186637878418 1.9454327821731567 ;
createNode mesh -n "polySurfaceShape52" -p "polySurface51";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.34986344 0.64028502
		 0.3525179 0.68557203 0.32890135 0.70772481 0.30528486 0.68557203 0.30793929 0.64028502
		 0.32890135 0.62163877;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.054527782 -0.074113585 
		0.15250216 0.12818825 0.073207304 0.098984785 0.069417447 0.14002104 -0.05043466 
		-0.054527715 0.073207304 -0.15250216 -0.12818825 -0.074113622 -0.098984785 -0.070603654 
		-0.14002104 0.051296506;
	setAttr -s 6 ".vt[0:5]"  -2.48880243 1.79042709 2.47362232 -2.23368025 2.30067134 2.28826547
		 -2.43723226 2.53207994 1.77075291 -2.86651492 2.30067134 1.41724324 -3.12163734 1.79042697 1.6026001
		 -2.92219377 1.56215739 2.12309766;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface52" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.8480260372161865 1.9499725103378296 2.8261990547180176 ;
	setAttr ".sp" -type "double3" -1.8480260372161865 1.9499725103378296 2.8261990547180176 ;
createNode mesh -n "polySurfaceShape53" -p "polySurface52";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.39629316 0.62543595
		 0.40289041 0.66908711 0.38359526 0.69991153 0.35895485 0.68447262 0.35629994 0.63917911
		 0.37465447 0.61206317;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.079693988 -0.097153358 
		0.12168714 0.15329866 0.050055709 0.068210378 0.072575957 0.1453332 -0.053490467 
		-0.079627655 0.097626269 -0.12168714 -0.15329866 -0.049715545 -0.068162121 -0.072757311 
		-0.1453332 0.052100223;
	setAttr -s 6 ".vt[0:5]"  -1.57200682 1.61348295 3.24766111 -1.31707788 2.12333989 3.062444925
		 -1.59666002 2.45333242 2.64093542 -2.12381554 2.2881 2.404737 -2.3789742 1.77778327 2.59012032
		 -2.10002017 1.4466126 3.0066475868;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface53" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.53757206350564957 3.4815421104431152 1.655311644077301 ;
	setAttr ".sp" -type "double3" 0.53757206350564957 3.4815421104431152 1.655311644077301 ;
createNode mesh -n "polySurfaceShape54" -p "polySurface53";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.53468215 0.80044574
		 0.55160791 0.8435328 0.50152797 0.86942601 0.45144805 0.8435328 0.46837378 0.80044568
		 0.50152797 0.7844162;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.16778649 -0.039960418 0.026327407 
		0.12011987 0.038918354 -0.12036593 -0.04694625 0.077819496 -0.1447269 -0.16778649 
		0.038918354 -0.026819389 -0.12012544 -0.039960489 0.11987574 0.047103044 -0.077819496 
		0.1447269;
	setAttr -s 6 ".vt[0:5]"  1.11869872 3.34313965 1.74649632 0.95360589 3.61633539 1.23842561
		 0.37497425 3.75106907 1.15405166 -0.043554589 3.61633539 1.56242299 0.12151897 3.34313941 2.070499897
		 0.70071292 3.21201515 2.15657163;
	setAttr -s 6 ".ed[0:5]"  2 1 0 1 0 0 3 2 0 4 3 0 0 5 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -2 -1 -3 -4 -6 -5
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface54" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.20518995821475983 2.8149776458740234 2.6774228811264038 ;
	setAttr ".sp" -type "double3" 0.20518995821475983 2.8149776458740234 2.6774228811264038 ;
createNode mesh -n "polySurfaceShape55" -p "polySurface54";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.4957785 0.72123522
		 0.49509138 0.76677012 0.46262431 0.78468347 0.43774596 0.75219834 0.44857988 0.70971411
		 0.4735201 0.69588834;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.16680211 -0.041409798 0.02960458 
		0.12361886 0.075731859 -0.090517476 -0.041533001 0.11774413 -0.1217598 -0.16680211 
		0.041406631 -0.029601552 -0.12356266 -0.074893758 0.091321632 0.041528855 -0.11774413 
		0.1217598;
	setAttr -s 6 ".vt[0:5]"  0.78290719 2.67155528 2.77995801 0.6333425 3.077274084 2.36391664
		 0.061340883 3.22278309 2.25570917 -0.37252727 2.95838904 2.57489824 -0.2227679 2.55558395 2.99371433
		 0.34902468 2.4071722 3.099136591;
	setAttr -s 6 ".ed[0:5]"  3 2 0 4 3 0 2 1 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -3 -1 -2 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface55" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.4084877073764801 2.8149776458740234 2.2866838574409485 ;
	setAttr ".sp" -type "double3" 1.4084877073764801 2.8149776458740234 2.2866838574409485 ;
createNode mesh -n "polySurfaceShape56" -p "polySurface55";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.55447602 0.70971411
		 0.56530994 0.75219834 0.54043162 0.78468347 0.50796455 0.76677012 0.50727737 0.72123522
		 0.52953577 0.69588834;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.15342814 -0.074893691 0.001253586 
		0.11733285 0.041406631 -0.12199087 -0.038181283 0.11774413 -0.12291705 -0.15342814 
		0.075731859 -0.00056758401 -0.11775818 -0.041409798 0.12199566 0.037757501 -0.11774413 
		0.12291705;
	setAttr -s 6 ".vt[0:5]"  1.93988431 2.55558419 2.29102564 1.81486869 2.95838904 1.86416984
		 1.27624726 3.22278309 1.86096203 0.87709111 3.077274084 2.28471804 1.00063359737 2.67155528 2.70921445
		 1.53926039 2.4071722 2.71240568;
	setAttr -s 6 ".ed[0:5]"  2 1 0 1 0 0 3 2 0 4 3 0 0 5 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -2 -1 -3 -4 -6 -5
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface56" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.16616277396678925 1.9499723315238953 3.3709224462509155 ;
	setAttr ".sp" -type "double3" -0.16616277396678925 1.9499723315238953 3.3709224462509155 ;
createNode mesh -n "polySurfaceShape57" -p "polySurface56";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.47412926 0.63917917
		 0.47147444 0.68447262 0.44683403 0.69991153 0.42753893 0.66908705 0.43413612 0.62543595
		 0.45577478 0.61206317;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.16409998 -0.049715564 0.03547141 
		0.1359603 0.097626321 -0.051133912 -0.027260041 0.14533326 -0.085424721 -0.16409998 
		0.050055761 -0.034414269 -0.13598555 -0.097153343 0.05211306 0.028252235 -0.14533326 
		0.085424721;
	setAttr -s 6 ".vt[0:5]"  0.40219566 1.77778304 3.49377728 0.30473417 2.2881 3.19382071
		 -0.26057762 2.45333242 3.075054884 -0.73452121 2.12333989 3.25172901 -0.63714719 1.61348283 3.55141544
		 -0.068311475 1.44661224 3.66679001;
	setAttr -s 6 ".ed[0:5]"  3 2 0 4 3 0 2 1 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -3 -1 -2 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface57" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.0227746963500977 2.047118604183197 3.1477764844894409 ;
	setAttr ".sp" -type "double3" 1.0227746963500977 2.047118604183197 3.1477764844894409 ;
createNode mesh -n "polySurfaceShape58" -p "polySurface57";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.52249002 0.64028507
		 0.52514452 0.68557209 0.50152797 0.70772481 0.47791135 0.68557209 0.48056588 0.64028507
		 0.50152791 0.62163877;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.16188818 -0.07411357 -0.0047331764 
		0.13375247 0.073207319 -0.091326244 -0.026515057 0.14002106 -0.081605054 -0.16188818 
		0.073207319 0.0047331764 -0.1337525 -0.074113607 0.091326244 0.026968131 -0.14002106 
		0.082999572;
	setAttr -s 6 ".vt[0:5]"  1.58347261 1.79042709 3.13138318 1.48602486 2.30067134 2.83146906
		 0.93094009 2.53207994 2.86513829 0.46207678 2.30067134 3.16416979 0.55952442 1.79042697 3.46408391
		 1.11617851 1.56215727 3.43524456;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface58" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.1168391704559326 1.9499725103378296 2.6309465169906616 ;
	setAttr ".sp" -type "double3" 2.1168391704559326 1.9499725103378296 2.6309465169906616 ;
createNode mesh -n "polySurfaceShape59" -p "polySurface58";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.56891978 0.62543595
		 0.575517 0.66908711 0.55622184 0.69991153 0.5315814 0.68447262 0.52892655 0.63917917
		 0.54728103 0.61206317;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.14034787 -0.097153358 -0.038197521 
		0.11223353 0.050055709 -0.12472499 -0.028455507 0.1453332 -0.085560746 -0.14034787 
		0.097626269 0.038119595 -0.11220816 -0.049715545 0.12472499 0.027056793 -0.1453332 
		0.08528877;
	setAttr -s 6 ".vt[0:5]"  2.60293245 1.61348295 2.49864984 2.50555873 2.12333989 2.19896293
		 2.018283844 2.45333242 2.33460784 1.63074589 2.2881 2.76297331 1.72820747 1.77778327 3.062930107
		 2.21055007 1.4466126 2.9263432;
	setAttr -s 6 ".ed[0:5]"  2 1 0 1 0 0 3 2 0 4 3 0 0 5 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -2 -1 -3 -4 -6 -5
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface59" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.3338468074798584 1.0209383517503738 -1.7451990842819214 ;
	setAttr ".sp" -type "double3" 3.3338468074798584 1.0209383517503738 -1.7451990842819214 ;
createNode mesh -n "polySurfaceShape60" -p "polySurface59";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.7219249 0.60259181
		 0.72124314 0.55699652 0.73920959 0.53301823 0.75803119 0.55370456 0.76032287 0.59922844
		 0.7416662 0.62487274;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.044635668 0.089301124 0.13822013 
		0.089323863 -0.0780228 0.12830228 0.043792751 -0.16908504 -0.01182814 -0.045185201 
		-0.090340652 -0.13822013 -0.089323863 0.078104809 -0.12911318 -0.04383371 0.16908504 
		0.01089095;
	setAttr -s 6 ".vt[0:5]"  3.48844194 1.33023179 -1.2664752 3.64321899 0.75070727 -1.3008256
		 3.48552251 0.43531421 -1.78616571 3.17734838 0.70804453 -2.22392297 3.024474621 1.29145348 -2.19238114
		 3.18202925 1.6065625 -1.7074784;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 1 0 0 2 1 0 3 2 0 4 3 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -3 -4 -5 -6 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface60" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.689704418182373 1.0209381431341171 -2.6309463977813721 ;
	setAttr ".sp" -type "double3" 2.689704418182373 1.0209381431341171 -2.6309463977813721 ;
createNode mesh -n "polySurfaceShape61" -p "polySurface60";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.77926928 0.62487274
		 0.76061261 0.5992285 0.76290435 0.55370456 0.78172594 0.53301817 0.79969233 0.55699652
		 0.79901057 0.60259181;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.023818392 0.16908504 0.038197555 
		0.095276326 0.078104869 0.12472495 0.11757705 -0.090340592 0.085560784 0.02486686 
		-0.16908504 -0.038119562 -0.094335176 -0.078022771 -0.12472495 -0.11757705 0.089301117 
		-0.085288733;
	setAttr -s 6 ".vt[0:5]"  2.60720968 1.60656226 -2.4986496 3.019692898 1.29145348 -2.19896293
		 3.096931219 0.70804453 -2.3346076 2.77583051 0.43531403 -2.76297307 2.3629756 0.75070715 -3.062929869
		 2.28247762 1.33023155 -2.92634296;
	setAttr -s 6 ".ed[0:5]"  1 0 0 0 5 0 2 1 0 3 2 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -3 -4 -5 -6 -2
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface61" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.1473530530929565 0.00024434924125671387 -2.2866839170455933 ;
	setAttr ".sp" -type "double3" 3.1473530530929565 0.00024434924125671387 -2.2866839170455933 ;
createNode mesh -n "polySurfaceShape62" -p "polySurface61";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.77894658 0.47721004
		 0.77889556 0.52277267 0.76046771 0.54491735 0.74203992 0.52277267 0.74198896 0.47721004
		 0.76046771 0.45501456;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.089604549 -0.086619712 
		-0.12199558 -0.088331327 0.086615503 -0.12291697 0.001724694 0.17091127 -0.0012535688 
		0.089604549 0.086615503 0.12199086 0.088334836 -0.086619712 0.12291697 -0.00078203063 
		-0.17091127 0.00056760124;
	setAttr -s 6 ".vt[0:5]"  2.83700871 -0.29976204 -2.70921421 2.8414185 0.30023617 -2.71240544
		 3.15332651 0.5921936 -2.29102564 3.45769739 0.30023617 -1.86416996 3.45329976 -0.29976204 -1.86096239
		 3.1446445 -0.59170491 -2.28471804;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -2 -1 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface62" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.7004331350326538 -2.9802322387695313e-008 -1.2023435831069946 ;
	setAttr ".sp" -type "double3" 3.7004331350326538 -2.9802322387695313e-008 -1.2023435831069946 ;
createNode mesh -n "polySurfaceShape63" -p "polySurface62";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.70023745 0.52278697
		 0.69838899 0.47722635 0.71635288 0.45325142 0.73438483 0.47721305 0.73623341 0.52277368
		 0.71826935 0.54674858;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.04408858 0.086537734 0.13290158 
		0.04801302 -0.086689889 0.14776896 0.0024883794 -0.17773922 0.0076584346 -0.042449143 
		-0.086537719 -0.13343427 -0.04801302 0.086689904 -0.14776896 -0.0024883794 0.17773922 
		-0.007658469;
	setAttr -s 6 ".vt[0:5]"  3.85313344 0.29972243 -0.74204046 3.86672568 -0.30024949 -0.69054747
		 3.70905161 -0.61559778 -1.17581868 3.55341101 -0.29972243 -1.66449165 3.53414059 0.30024949 -1.7141397
		 3.69181466 0.61559772 -1.2288686;
	setAttr -s 6 ".ed[0:5]"  5 4 0 4 3 0 0 5 0 1 0 0 2 1 0 3 2 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -5 -6 -2 -1 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface63" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.2869936227798462 2.9802322387695313e-008 -3.1477764844894409 ;
	setAttr ".sp" -type "double3" 2.2869936227798462 2.9802322387695313e-008 -3.1477764844894409 ;
createNode mesh -n "polySurfaceShape64" -p "polySurface63";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.80266607 0.54674858
		 0.78470212 0.52277362 0.7865507 0.47721305 0.80458266 0.45325142 0.82254666 0.47722635
		 0.8206982 0.52278692;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.0065146959 0.17773922 0.0047332454 
		0.12569986 0.086689889 0.091326319 0.11378592 -0.086537734 0.081604987 -0.0065146959 
		-0.17773922 -0.0047331764 -0.12569986 -0.086689904 -0.091326319 -0.11277273 0.086537719 
		-0.082999572;
	setAttr -s 6 ".vt[0:5]"  2.3095572 0.61559778 -3.13138294 2.7223537 0.30024949 -2.83146882
		 2.68108988 -0.29972243 -2.86513853 2.26443005 -0.61559772 -3.16416979 1.85163355 -0.30024949 -3.46408415
		 1.89640653 0.29972243 -3.43524456;
	setAttr -s 6 ".ed[0:5]"  1 0 0 2 1 0 0 5 0 3 2 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -2 -4 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface64" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.3527767658233643 -1.075366884469986 -1.6553120613098145 ;
	setAttr ".sp" -type "double3" 3.3527767658233643 -1.075366884469986 -1.6553120613098145 ;
createNode mesh -n "polySurfaceShape65" -p "polySurface64";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.75635749 0.39282873
		 0.75586635 0.43843955 0.7378788 0.46240455 0.71902037 0.44194275 0.71753925 0.39648068
		 0.73636663 0.37076181;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.088996194 -0.089805648 
		-0.11987568 -0.048071429 0.076699123 -0.14472684 0.039762028 0.16771071 -0.026327424 
		0.088996194 0.089800626 0.12036587 0.049076181 -0.077024966 0.14472684 -0.039759483 
		-0.16771071 0.026819406;
	setAttr -s 6 ".vt[0:5]"  3.044539452 -1.38640773 -2.070500135 3.18628192 -0.80972034 -2.15657187
		 3.49049211 -0.49450272 -1.7464968 3.66101408 -0.76434344 -1.23842621 3.52275157 -1.34214199 -1.15405226
		 3.21507025 -1.65623105 -1.56242335;
	setAttr -s 6 ".ed[0:5]"  2 1 0 3 2 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -1 -2 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface65" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.6108978986740112 -1.0753667801618576 -2.6774230003356934 ;
	setAttr ".sp" -type "double3" 2.6108978986740112 -1.0753667801618576 -2.6774230003356934 ;
createNode mesh -n "polySurfaceShape66" -p "polySurface65";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.80339628 0.39648068
		 0.80191511 0.44194275 0.7830568 0.46240455 0.76506913 0.43843955 0.76457793 0.39282876
		 0.78456885 0.37076181;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.12263329 -0.077024959 
		-0.091321528 -0.087128662 0.089800641 -0.12175977 0.037170738 0.16771071 -0.029604545 
		0.12263329 0.076699093 0.090517439 0.086352035 -0.089805678 0.12175977 -0.037948396 
		-0.16771071 0.029601585;
	setAttr -s 6 ".vt[0:5]"  2.1861589 -1.34214187 -2.99371409 2.30912876 -0.76434326 -3.099136591
		 2.73963833 -0.49450263 -2.77995801 3.035636902 -0.80972034 -2.36391687 2.9099772 -1.38640773 -2.25570941
		 2.47946405 -1.65623093 -2.57489824;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface66" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.7221710681915283 -1.0209383815526962 -0.54655412933789194 ;
	setAttr ".sp" -type "double3" 3.7221710681915283 -1.0209383815526962 -0.54655412933789194 ;
createNode mesh -n "polySurfaceShape67" -p "polySurface66";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.6765911 0.44629544
		 0.67429936 0.40077156 0.69295603 0.37512723 0.71269733 0.39740819 0.71337909 0.44300348
		 0.6954127 0.4669818;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.044910401 0.090340659 0.13805364 
		0.0038486468 -0.078104801 0.15663001 -0.041641504 -0.16908504 0.016625846 -0.044910401 
		-0.089301117 -0.13838661 -0.0029273229 0.078022808 -0.15663001 0.042603787 0.16908504 
		-0.016499558;
	setAttr -s 6 ".vt[0:5]"  3.87771773 -0.70804453 -0.068406902 3.73550081 -1.29145348 -0.0040678601
		 3.57794619 -1.6065625 -0.4889707 3.5666244 -1.33023179 -1.025854588 3.71203232 -0.75070727 -1.089040399
		 3.8697288 -0.43531427 -0.60370016;
	setAttr -s 6 ".ed[0:5]"  5 4 0 4 3 0 0 5 0 1 0 0 2 1 0 3 2 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -5 -6 -2 -1 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface67" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.6705108880996704 -1.0209382176399231 -3.3709224462509155 ;
	setAttr ".sp" -type "double3" 1.6705108880996704 -1.0209382176399231 -3.3709224462509155 ;
createNode mesh -n "polySurfaceShape68" -p "polySurface67";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.82552284 0.46698183
		 0.80755633 0.44300348 0.80823827 0.39740822 0.82797945 0.37512723 0.84663612 0.40077156
		 0.84434432 0.44629544;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.02871499 0.16908506 -0.03547141 
		0.14791703 0.078022793 0.051133912 0.11759312 -0.089301094 0.085424721 -0.028822342 
		-0.16908506 0.034414269 -0.14791703 -0.078104846 -0.05211306 -0.11756101 0.090340614 
		-0.085424721;
	setAttr -s 6 ".vt[0:5]"  1.76996493 -0.43531406 -3.49377728 2.18281984 -0.75070715 -3.19382071
		 2.07779336 -1.33023155 -3.075054884 1.57068503 -1.60656238 -3.25172901 1.15820193 -1.29145348 -3.55141544
		 1.26333964 -0.70804453 -3.66679001;
	setAttr -s 6 ".ed[0:5]"  1 0 0 2 1 0 0 5 0 3 2 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -2 -4 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface68" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.2589110136032104 -1.9499725103378296 -0.88420763611793518 ;
	setAttr ".sp" -type "double3" 3.2589110136032104 -1.9499725103378296 -0.88420763611793518 ;
createNode mesh -n "polySurfaceShape69" -p "polySurface68";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.73041427 0.31552741
		 0.73306912 0.36082086 0.71471471 0.38793683 0.69307595 0.37456402 0.68647867 0.33091295
		 0.70577389 0.30008847;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.091114774 -0.097626269 
		-0.11334129 -0.017443851 0.049715545 -0.16686638 0.072043844 0.1453332 -0.053103901 
		0.091114774 0.097153358 0.11338941 0.017510278 -0.050055709 0.16686638 -0.073289394 
		-0.1453332 0.052486926;
	setAttr -s 6 ".vt[0:5]"  2.94333601 -2.2881 -1.27676392 3.19849443 -1.77778327 -1.46214747
		 3.50843406 -1.4466126 -1.068132401 3.57448602 -1.61348295 -0.4914847 3.31955767 -2.12333989 -0.3062678
		 3.0050740242 -2.45333242 -0.70241976;
	setAttr -s 6 ".ed[0:5]"  2 1 0 3 2 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -1 -2 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface69" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.6776586771011353 -2.047118604183197 -1.9454327821731567 ;
	setAttr ".sp" -type "double3" 2.6776586771011353 -2.047118604183197 -1.9454327821731567 ;
createNode mesh -n "polySurfaceShape70" -p "polySurface69";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.78408426 0.31442794
		 0.78142971 0.35971493 0.76046777 0.3783612 0.73950571 0.35971493 0.73685122 0.31442794
		 0.76046771 0.29227522;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.12818821 -0.073207319 
		-0.098984785 -0.054527748 0.074113607 -0.15250224 0.070603624 0.14002106 -0.051296577 
		0.12818821 0.074113533 0.098984718 0.054527748 -0.073207319 0.15250224 -0.069417343 
		-0.14002106 0.050434694;
	setAttr -s 6 ".vt[0:5]"  2.23368025 -2.30067134 -2.28826547 2.48880243 -1.79042697 -2.47362256
		 2.92219353 -1.56215727 -2.1230979 3.12163711 -1.79042721 -1.60260034 2.86651492 -2.30067134 -1.417243
		 2.43723249 -2.53207994 -1.77075279;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface70" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.8480260968208313 -1.94997239112854 -2.8261990547180176 ;
	setAttr ".sp" -type "double3" 1.8480260968208313 -1.94997239112854 -2.8261990547180176 ;
createNode mesh -n "polySurfaceShape71" -p "polySurface70";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.8344568 0.33091295
		 0.82785946 0.37456402 0.80622083 0.38793686 0.78786641 0.36082089 0.79052126 0.31552744
		 0.81516165 0.30008847;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.15329857 -0.050055742 
		-0.068210311 -0.079694033 0.097153358 -0.12168714 0.072757229 0.14533325 -0.05210029 
		0.15329857 0.049715582 0.068162054 0.079627708 -0.097626306 0.12168714 -0.072575912 
		-0.14533325 0.053490538;
	setAttr -s 6 ".vt[0:5]"  1.31707823 -2.12333989 -3.062444687 1.5720067 -1.61348283 -3.24766111
		 2.10001993 -1.44661236 -3.0066478252 2.37897396 -1.77778304 -2.59012055 2.12381577 -2.2881 -2.404737
		 1.59666026 -2.45333242 -2.64093518;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface71" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.63090327009558678 1.0209383815526962 -3.710407018661499 ;
	setAttr ".sp" -type "double3" -0.63090327009558678 1.0209383815526962 -3.710407018661499 ;
createNode mesh -n "polySurfaceShape72" -p "polySurface71";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.055124175 0.59474379
		 0.048929047 0.57619733 0.048703443 0.53301823 0.067524984 0.55370456 0.069816723
		 0.59922844 0.051160049 0.62487274;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.14563397 0.089301117 0.00038666133 
		0.15001093 -0.078022808 -0.045179144 0.0026690688 -0.16908504 -0.045179144 -0.14503255 
		-0.090340659 0.00038666133 -0.15001093 0.078104801 0.045179144 -0.0028018244 0.16908504 
		0.045179144;
	setAttr -s 6 ".vt[0:5]"  -0.12650166 1.33023179 -3.70906782 -0.11134212 0.75070727 -3.86688447
		 -0.62165898 0.43531427 -3.86688447 -1.13322186 0.70804453 -3.70906782 -1.15046442 1.29145348 -3.55392957
		 -0.64060736 1.6065625 -3.55392957;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 1 0 0 2 1 0 3 2 0 4 3 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -3 -4 -5 -6 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface72" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.6705108880996704 1.0209382176399231 -3.3709224462509155 ;
	setAttr ".sp" -type "double3" -1.6705108880996704 1.0209382176399231 -3.3709224462509155 ;
createNode mesh -n "polySurfaceShape73" -p "polySurface72";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.088763162 0.62487274
		 0.070106491 0.5992285 0.072398201 0.55370456 0.091219768 0.53301817 0.10918622 0.55699652
		 0.1085044 0.60259181;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.028822342 0.16908506 0.034414269 
		0.14791703 0.078104846 -0.05211306 0.11756101 -0.090340614 -0.085424721 -0.02871499 
		-0.16908506 -0.03547141 -0.14791703 -0.078022793 0.051133912 -0.11759312 0.089301094 
		0.085424721;
	setAttr -s 6 ".vt[0:5]"  -1.57068503 1.60656238 -3.25172901 -1.15820193 1.29145348 -3.55141544
		 -1.26333964 0.70804453 -3.66679001 -1.76996493 0.43531406 -3.49377728 -2.18281984 0.75070715 -3.19382071
		 -2.07779336 1.33023155 -3.075054884;
	setAttr -s 6 ".ed[0:5]"  1 0 0 0 5 0 2 1 0 3 2 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -3 -4 -5 -6 -2
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface73" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.2021783888339996 0.00024431943893432617 -3.6999373435974121 ;
	setAttr ".sp" -type "double3" -1.2021783888339996 0.00024431943893432617 -3.6999373435974121 ;
createNode mesh -n "polySurfaceShape74" -p "polySurface73";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.088440433 0.47721004
		 0.088389471 0.52277267 0.069961622 0.54491735 0.05153377 0.52277267 0.051482778 0.47721004
		 0.069961622 0.45501456;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.14371462 -0.086619705 
		0.04752107 -0.1441974 0.08661551 0.046025433 -0.00065980072 0.17091124 -0.002026926 
		0.14370902 0.08661551 -0.04752107 0.1441974 -0.086619705 -0.046027225 0.00029759397 
		-0.17091124 0.00091987813;
	setAttr -s 6 ".vt[0:5]"  -1.69993234 -0.29976204 -3.53534865 -1.70160449 0.30023617 -3.54052877
		 -1.2044636 0.59219348 -3.70695758 -0.70444381 0.30023617 -3.86452603 -0.70275229 -0.29976204 -3.85935211
		 -1.20114768 -0.59170485 -3.69675136;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -2 -1 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface74" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0 0 -3.8923581838607788 ;
	setAttr ".sp" -type "double3" 0 0 -3.8923581838607788 ;
createNode mesh -n "polySurfaceShape75" -p "polySurface74";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.031300139 0.51548177
		 0.026804965 0.5 0.034872603 0.5 0.043878715 0.47721305 0.045727115 0.52277368 0.037466776
		 0.53672004;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.14002104 0.086537726 -0.00043095837 
		0.1553735 -0.086689897 0.00043088954 0.0080525735 -0.17773922 0.00043095837 -0.14002104 
		-0.086537726 -0.00043095837 -0.1553735 0.086689897 0.00043088954 -0.0080525735 0.17773922 
		0.00043095837;
	setAttr -s 6 ".vt[0:5]"  0.4849613 0.29972243 -3.8938508 0.53813434 -0.30024949 -3.8908658
		 0.027889997 -0.61559778 -3.89086556 -0.4849613 -0.29972243 -3.8938508 -0.53813434 0.30024949 -3.8908658
		 -0.027889997 0.61559778 -3.89086556;
	setAttr -s 6 ".ed[0:5]"  5 4 0 4 3 0 0 5 0 1 0 0 2 1 0 3 2 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -5 -6 -2 -1 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface75" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.2869936227798462 -2.9802322387695313e-008 -3.1477764844894409 ;
	setAttr ".sp" -type "double3" -2.2869936227798462 -2.9802322387695313e-008 -3.1477764844894409 ;
createNode mesh -n "polySurfaceShape76" -p "polySurface75";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.11215995 0.54674858
		 0.094196066 0.52277368 0.096044466 0.47721305 0.11407654 0.45325142 0.13204043 0.47722635
		 0.130192 0.52278697;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.0065146959 0.17773922 -0.0047331764 
		0.12569986 0.086689904 -0.091326319 0.11277273 -0.086537719 -0.082999572 -0.0065146959 
		-0.17773922 0.0047332454 -0.12569986 -0.086689889 0.091326319 -0.11378592 0.086537734 
		0.081604987;
	setAttr -s 6 ".vt[0:5]"  -2.26443005 0.61559772 -3.16416979 -1.85163355 0.30024949 -3.46408415
		 -1.89640653 -0.29972243 -3.43524456 -2.3095572 -0.61559778 -3.13138294 -2.7223537 -0.30024949 -2.83146882
		 -2.68108988 0.29972243 -2.86513853;
	setAttr -s 6 ".ed[0:5]"  1 0 0 2 1 0 0 5 0 3 2 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -2 -4 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface76" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.53769280528649688 -1.0753669440746307 -3.6999372243881226 ;
	setAttr ".sp" -type "double3" -0.53769280528649688 -1.0753669440746307 -3.6999372243881226 ;
createNode mesh -n "polySurfaceShape77" -p "polySurface76";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.065851435 0.39282873
		 0.065360203 0.43843955 0.047372621 0.46240455 0.037692707 0.45383298 0.042795192
		 0.43219712 0.046627533 0.41594681;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.14166512 -0.089805663 
		0.047521036 -0.15265357 0.076699123 0.00091984367 -0.012906958 0.16771069 -0.046027258 
		0.14182088 0.089800641 -0.047521036 0.15265357 -0.077024952 -0.0020269603 0.013065202 
		-0.16771069 0.046025399;
	setAttr -s 6 ".vt[0:5]"  -1.028348327 -1.38640785 -3.53534865 -1.066406727 -0.8097204 -3.69675136
		 -0.58239591 -0.49450284 -3.85935211 -0.046497814 -0.76434344 -3.86452579 -0.0089788865 -1.34214199 -3.70695758
		 -0.49244162 -1.65623105 -3.54052877;
	setAttr -s 6 ".ed[0:5]"  2 1 0 3 2 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -1 -2 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface77" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.7399846315383911 -1.0753667950630188 -3.3109108209609985 ;
	setAttr ".sp" -type "double3" -1.7399846315383911 -1.0753667950630188 -3.3109108209609985 ;
createNode mesh -n "polySurfaceShape78" -p "polySurface77";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.11289014 0.39648071
		 0.11140902 0.44194275 0.09255062 0.46240455 0.074562982 0.43843955 0.07407178 0.39282873
		 0.094062701 0.37076184;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.12462772 -0.077024959 
		0.088535495 -0.14260468 0.089800648 0.0453627 -0.016549235 0.16771071 -0.044375565 
		0.12410297 0.0766991 -0.088535495 0.14260468 -0.08980567 -0.044375565 0.016546104 
		-0.16771071 0.045362629;
	setAttr -s 6 ".vt[0:5]"  -2.17163134 -1.34214187 -3.0042691231 -2.23389435 -0.76434326 -3.15379763
		 -1.79730272 -0.49450266 -3.46460509 -1.31015539 -0.80972034 -3.61755252 -1.24607491 -1.38640773 -3.46460509
		 -1.68267739 -1.65623093 -3.15379786;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface78" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.63090327009558678 -1.0209383815526962 -3.710407018661499 ;
	setAttr ".sp" -type "double3" 0.63090327009558678 -1.0209383815526962 -3.710407018661499 ;
createNode mesh -n "polySurfaceShape79" -p "polySurface78";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.84921759 0.44629547
		 0.84692591 0.40077156 0.86558253 0.37512723 0.88532382 0.39740819 0.88600564 0.44300348
		 0.86803919 0.4669818;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.14503255 0.090340659 0.00038666133 
		0.15001093 -0.078104801 0.045179144 0.0028018244 -0.16908504 0.045179144 -0.14563397 
		-0.089301117 0.00038666133 -0.15001093 0.078022808 -0.045179144 -0.0026690688 0.16908504 
		-0.045179144;
	setAttr -s 6 ".vt[0:5]"  1.13322186 -0.70804453 -3.70906782 1.15046442 -1.29145348 -3.55392957
		 0.64060736 -1.6065625 -3.55392957 0.12650166 -1.33023179 -3.70906782 0.11134212 -0.75070727 -3.86688447
		 0.62165898 -0.43531427 -3.86688447;
	setAttr -s 6 ".ed[0:5]"  1 0 0 2 1 0 5 4 0 4 3 0 0 5 0 3 2 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -2 -6 -4 -3 -5
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface79" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.689704418182373 -1.0209381431341171 -2.6309463977813721 ;
	setAttr ".sp" -type "double3" -2.689704418182373 -1.0209381431341171 -2.6309463977813721 ;
createNode mesh -n "polySurfaceShape80" -p "polySurface79";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.13501669 0.46698183
		 0.11705025 0.44300348 0.11773209 0.39740822 0.13747333 0.37512726 0.15612994 0.40077156
		 0.15383829 0.44629547;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.02486686 0.16908504 -0.038119562 
		0.094335176 0.078022771 -0.12472495 0.11757705 -0.089301117 -0.085288733 0.023818392 
		-0.16908504 0.038197555 -0.095276326 -0.078104869 0.12472495 -0.11757705 0.090340592 
		0.085560784;
	setAttr -s 6 ".vt[0:5]"  -2.77583051 -0.43531403 -2.76297307 -2.3629756 -0.75070715 -3.062929869
		 -2.28247762 -1.33023155 -2.92634296 -2.60720968 -1.60656226 -2.4986496 -3.019692898 -1.29145348 -2.19896293
		 -3.096931219 -0.70804453 -2.3346076;
	setAttr -s 6 ".ed[0:5]"  1 0 0 2 1 0 0 5 0 3 2 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -2 -4 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface80" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.16616278886795044 -1.9499725103378296 -3.3709224462509155 ;
	setAttr ".sp" -type "double3" 0.16616278886795044 -1.9499725103378296 -3.3709224462509155 ;
createNode mesh -n "polySurfaceShape81" -p "polySurface80";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.90304083 0.31552744
		 0.9056958 0.36082086 0.88734126 0.38793683 0.86570257 0.37456405 0.85910529 0.33091295
		 0.8784005 0.30008847;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.13596021 -0.097626269 
		0.051133912 -0.16410008 0.049715545 -0.03547141 -0.0282523 0.1453332 -0.085424721 
		0.13598551 0.097153358 -0.05211306 0.16410008 -0.050055709 0.03441434 0.027260123 
		-0.1453332 0.085424721;
	setAttr -s 6 ".vt[0:5]"  -0.30473387 -2.2881 -3.19382071 -0.40219599 -1.77778327 -3.49377728
		 0.068311267 -1.4466126 -3.66679001 0.63714707 -1.61348295 -3.55141544 0.73452157 -2.12333989 -3.25172877
		 0.26057792 -2.45333242 -3.075054884;
	setAttr -s 6 ".ed[0:5]"  4 3 0 2 1 0 3 2 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -3 -1 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface81" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.0227745920419693 -2.0471186637878418 -3.1477766036987305 ;
	setAttr ".sp" -type "double3" -1.0227745920419693 -2.0471186637878418 -3.1477766036987305 ;
createNode mesh -n "polySurfaceShape82" -p "polySurface81";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.093578115 0.31442794
		 0.090923682 0.35971496 0.069961622 0.3783612 0.059623044 0.37022203 0.065640315 0.34905025
		 0.069961593 0.33384573;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.13375239 -0.073207304 
		0.091326214 -0.16188829 0.074113622 0.0047332109 -0.026968196 0.14002104 -0.082999535 
		0.13375242 0.074113585 -0.091326214 0.16188829 -0.073207304 -0.0047332109 0.026515113 
		-0.14002104 0.081605025;
	setAttr -s 6 ".vt[0:5]"  -1.4860245 -2.30067134 -2.8314693 -1.58347285 -1.79042697 -3.13138318
		 -1.11617863 -1.56215739 -3.43524456 -0.5595246 -1.79042709 -3.46408391 -0.46207634 -2.30067134 -3.16417003
		 -0.93093979 -2.53207994 -2.86513853;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface82" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.1168391704559326 -1.9499723315238953 -2.6309467554092407 ;
	setAttr ".sp" -type "double3" -2.1168391704559326 -1.9499723315238953 -2.6309467554092407 ;
createNode mesh -n "polySurfaceShape83" -p "polySurface82";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.1439506 0.33091295
		 0.13735338 0.37456405 0.11571471 0.38793689 0.097360209 0.36082089 0.10001506 0.31552744
		 0.12465547 0.30008847;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.11223346 -0.050055761 
		0.12472492 -0.14034794 0.097153343 0.038197659 -0.027056862 0.14533326 -0.085288629 
		0.11220809 0.049715564 -0.12472492 0.14034794 -0.097626321 -0.038119595 0.028455576 
		-0.14533326 0.085560746;
	setAttr -s 6 ".vt[0:5]"  -2.50555849 -2.12333989 -2.1989634 -2.60293269 -1.61348283 -2.4986496
		 -2.21055031 -1.44661224 -2.92634296 -1.72820771 -1.77778304 -3.062930107 -1.63074565 -2.2881 -2.76297355
		 -2.018283606 -2.45333242 -2.33460808;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface83" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.7221710681915283 1.0209383815526962 -0.54655409790575504 ;
	setAttr ".sp" -type "double3" -3.7221710681915283 1.0209383815526962 -0.54655409790575504 ;
createNode mesh -n "polySurfaceShape84" -p "polySurface83";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.20404534 0.60259181
		 0.20336349 0.55699652 0.22132997 0.53301823 0.24015154 0.55370456 0.24244325 0.59922844
		 0.22378661 0.62487274;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.044910401 0.08930108 -0.13838662 
		0.0029273229 -0.078022808 -0.15663002 -0.042603787 -0.16908504 -0.016499566 -0.044910401 
		-0.090340659 0.13805363 -0.0038486468 0.078104801 0.15663002 0.041641437 0.16908504 
		0.016625838;
	setAttr -s 6 ".vt[0:5]"  -3.5666244 1.33023167 -1.025854588 -3.71203232 0.75070727 -1.089040399
		 -3.8697288 0.43531427 -0.60370016 -3.87771773 0.70804453 -0.068406902 -3.73550081 1.29145348 -0.0040677972
		 -3.57794642 1.6065625 -0.4889707;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 1 0 0 2 1 0 3 2 0 4 3 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -3 -4 -5 -6 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface84" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.7221711874008179 1.0209381878376007 0.54655390372499824 ;
	setAttr ".sp" -type "double3" -3.7221711874008179 1.0209381878376007 0.54655390372499824 ;
createNode mesh -n "polySurfaceShape85" -p "polySurface84";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.26138961 0.62487274
		 0.24273302 0.59922844 0.24502473 0.55370456 0.26384625 0.53301817 0.28181273 0.55699652
		 0.28113091 0.60259181;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.04164147 0.16908506 -0.01662579 
		-0.0038486123 0.078104861 -0.15663001 -0.044910435 -0.090340599 -0.13805355 -0.042603821 
		-0.16908506 0.016499605 0.0029272886 -0.078022785 0.15663001 0.044910435 0.089301102 
		0.13838667;
	setAttr -s 6 ".vt[0:5]"  -3.57794642 1.60656238 0.48897067 -3.73550081 1.29145348 0.0040676473
		 -3.87771797 0.70804453 0.068406962 -3.86972904 0.435314 0.6037001 -3.71203256 0.75070715 1.08904016
		 -3.5666244 1.33023155 1.025854588;
	setAttr -s 6 ".ed[0:5]"  1 0 0 0 5 0 2 1 0 3 2 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -3 -4 -5 -6 -2
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface85" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.8923602104187012 0.00024431943893432617 2.6822090148925781e-007 ;
	setAttr ".sp" -type "double3" -3.8923602104187012 0.00024431943893432617 2.6822090148925781e-007 ;
createNode mesh -n "polySurfaceShape86" -p "polySurface85";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.26106691 0.47721004
		 0.26101595 0.52277267 0.24258815 0.54491735 0.2241603 0.52277267 0.22410931 0.47721004
		 0.24258818 0.45501456;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.0013673231 -0.086619705 
		0.15136431 -0.00020431027 0.08661551 0.15136132 -0.0015491924 0.17091127 -5.7424824e-008 
		-0.00020424144 0.08661551 -0.15136144 0.0013673231 -0.086619705 -0.15136431 0.0015491924 
		-0.17091127 -1.1729953e-009;
	setAttr -s 6 ".vt[0:5]"  -3.8876245 -0.29976204 0.52424884 -3.89306784 0.30023617 0.52423847
		 -3.89772582 0.59219354 6.9330675e-008 -3.8930676 0.30023617 -0.52423835 -3.8876245 -0.29976204 -0.5242483
		 -3.8869946 -0.59170491 2.6415825e-007;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -2 -1 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface86" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.7004331350326538 2.9802322387695313e-008 -1.2023435831069946 ;
	setAttr ".sp" -type "double3" -3.7004331350326538 2.9802322387695313e-008 -1.2023435831069946 ;
createNode mesh -n "polySurfaceShape87" -p "polySurface86";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.18235771 0.52278697
		 0.18050928 0.47722635 0.1984732 0.45325142 0.21650527 0.47721305 0.2183537 0.52277368
		 0.20038979 0.54674858;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.042449143 0.086537719 -0.13343427 
		0.04801302 -0.086689904 -0.14776896 0.0024883794 -0.17773922 -0.007658469 -0.04408858 
		-0.086537734 0.13290158 -0.04801302 0.086689889 0.14776896 -0.0024883794 0.17773922 
		0.0076584346;
	setAttr -s 6 ".vt[0:5]"  -3.55341101 0.29972243 -1.66449165 -3.53414059 -0.30024949 -1.7141397
		 -3.69181466 -0.61559772 -1.2288686 -3.85313344 -0.29972243 -0.74204046 -3.86672568 0.30024949 -0.69054747
		 -3.70905161 0.61559778 -1.17581868;
	setAttr -s 6 ".ed[0:5]"  5 4 0 4 3 0 0 5 0 1 0 0 2 1 0 3 2 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -5 -6 -2 -1 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface87" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.7004332542419434 2.9802322387695313e-008 1.2023435831069946 ;
	setAttr ".sp" -type "double3" -3.7004332542419434 2.9802322387695313e-008 1.2023435831069946 ;
createNode mesh -n "polySurfaceShape88" -p "polySurface87";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.28478646 0.54674858
		 0.26682255 0.52277368 0.26867098 0.47721305 0.28670305 0.45325142 0.30466697 0.47722635
		 0.30281848 0.52278697;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.0024884138 0.17773923 
		-0.0076585035 -0.048013054 0.086689889 -0.14776902 -0.044088617 -0.086537734 -0.13290152 
		0.0024883449 -0.17773923 0.0076585379 0.048013054 -0.086689904 0.14776902 0.042449109 
		0.086537719 0.13343419;
	setAttr -s 6 ".vt[0:5]"  -3.70905185 0.61559784 1.17581844 -3.86672592 0.30024949 0.69054723
		 -3.85313368 -0.29972243 0.74204069 -3.6918149 -0.61559778 1.22886884 -3.53414059 -0.30024949 1.71413994
		 -3.55341125 0.29972243 1.66449142;
	setAttr -s 6 ".ed[0:5]"  1 0 0 2 1 0 0 5 0 3 2 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -2 -4 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface88" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.6849241256713867 -1.0753669291734695 -0.63222377002239227 ;
	setAttr ".sp" -type "double3" -3.6849241256713867 -1.0753669291734695 -0.63222377002239227 ;
createNode mesh -n "polySurfaceShape89" -p "polySurface88";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.23847799 0.39282876
		 0.23798676 0.43843952 0.21999918 0.46240452 0.20114072 0.44194275 0.19965966 0.39648068
		 0.21848704 0.37076181;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.0013946517 -0.089805633 
		0.1494904 -0.046321299 0.076699138 0.14554049 -0.047786579 0.16771071 -0.0018738868 
		-0.0013936879 0.089800633 -0.1494904 0.045221273 -0.077024952 -0.14573444 0.047786579 
		-0.16771071 0.0018709698;
	setAttr -s 6 ".vt[0:5]"  -3.68009377 -1.38640773 -0.11446545 -3.84535742 -0.80972034 -0.12814592
		 -3.8504324 -0.49450281 -0.63871396 -3.68975115 -0.76434344 -1.14998209 -3.52830076 -1.34214199 -1.13697338
		 -3.51941586 -1.65623105 -0.62574369;
	setAttr -s 6 ".ed[0:5]"  2 1 0 3 2 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -1 -2 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface89" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.6849241256713867 -1.0753667503595352 0.6322241984307766 ;
	setAttr ".sp" -type "double3" -3.6849241256713867 -1.0753667503595352 0.6322241984307766 ;
createNode mesh -n "polySurfaceShape90" -p "polySurface89";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.28551662 0.39648071
		 0.28403556 0.44194275 0.26517707 0.46240455 0.24718954 0.43843955 0.24669828 0.39282873
		 0.26668924 0.37076181;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.045221273 -0.077024974 
		0.14573446 -0.0013936879 0.089800633 0.14949042 -0.047786579 0.16771072 0.0018739008 
		-0.046321299 0.076699086 -0.14554045 0.0013946517 -0.089805685 -0.14949042 0.047786579 
		-0.16771072 -0.001870973;
	setAttr -s 6 ".vt[0:5]"  -3.52830076 -1.34214187 1.13697386 -3.68975115 -0.76434326 1.14998257
		 -3.8504324 -0.49450257 0.63871443 -3.84535742 -0.80972034 0.12814651 -3.68009377 -1.38640773 0.11446583
		 -3.51941586 -1.65623093 0.6257441;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface90" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.3338468074798584 -1.0209383517503738 -1.7451990842819214 ;
	setAttr ".sp" -type "double3" -3.3338468074798584 -1.0209383517503738 -1.7451990842819214 ;
createNode mesh -n "polySurfaceShape91" -p "polySurface90";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.15871148 0.44629547
		 0.1564198 0.40077156 0.17507641 0.37512723 0.19481771 0.39740819 0.19549946 0.44300348
		 0.17753302 0.46698183;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.045185201 0.090340652 -0.13822013 
		0.089323863 -0.078104809 -0.12911318 0.04383371 -0.16908504 0.01089095 -0.044635668 
		-0.089301124 0.13822013 -0.089323863 0.0780228 0.12830228 -0.043792751 0.16908504 
		-0.01182814;
	setAttr -s 6 ".vt[0:5]"  -3.17734838 -0.70804453 -2.22392297 -3.024474621 -1.29145348 -2.19238114
		 -3.18202925 -1.6065625 -1.7074784 -3.48844194 -1.33023179 -1.2664752 -3.64321899 -0.75070727 -1.3008256
		 -3.48552251 -0.43531421 -1.78616571;
	setAttr -s 6 ".ed[0:5]"  1 0 0 2 1 0 5 4 0 4 3 0 0 5 0 3 2 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -2 -6 -4 -3 -5
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface91" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.3338469266891479 -1.0209382176399231 1.7451992034912109 ;
	setAttr ".sp" -type "double3" -3.3338469266891479 -1.0209382176399231 1.7451992034912109 ;
createNode mesh -n "polySurfaceShape92" -p "polySurface91";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.30764318 0.46698183
		 0.28967679 0.44300348 0.29035857 0.39740822 0.31009984 0.37512726 0.32875651 0.40077156
		 0.32646477 0.44629544;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.043792717 0.16908506 0.011828175 
		-0.089323893 0.078022793 -0.12830225 -0.044635635 -0.089301094 -0.1382201 0.043833744 
		-0.16908506 -0.01089095 0.089323893 -0.078104846 0.12911321 0.045185234 0.090340614 
		0.1382201;
	setAttr -s 6 ".vt[0:5]"  -3.48552251 -0.43531406 1.78616595 -3.64321923 -0.75070715 1.30082583
		 -3.48844194 -1.33023155 1.26647544 -3.18202925 -1.60656238 1.70747852 -3.024474621 -1.29145348 2.19238138
		 -3.17734838 -0.70804453 2.22392297;
	setAttr -s 6 ".ed[0:5]"  1 0 0 2 1 0 0 5 0 3 2 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -2 -4 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface92" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.1551215648651123 -1.9499725103378296 -1.2002682089805603 ;
	setAttr ".sp" -type "double3" -3.1551215648651123 -1.9499725103378296 -1.2002682089805603 ;
createNode mesh -n "polySurfaceShape93" -p "polySurface92";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.21253468 0.31552744
		 0.21518953 0.36082083 0.19683506 0.38793683 0.17519639 0.37456405 0.16859911 0.33091295
		 0.18789427 0.30008847;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.0067705316 -0.097626269 
		0.14527044 -0.084291756 0.049715545 0.14527051 -0.089820869 0.1453332 0.0006351826 
		-0.0073873173 0.097153358 -0.14527041 0.083592914 -0.050055709 -0.14527051 0.089820869 
		-0.1453332 0.0006351138;
	setAttr -s 6 ".vt[0:5]"  -3.13167191 -2.2881 -0.69712567 -3.44706511 -1.77778327 -0.69712543
		 -3.46621513 -1.4466126 -1.19806826 -3.18070745 -1.61348295 -1.70341063 -2.86559844 -2.12333989 -1.70341098
		 -2.844028 -2.45333242 -1.1980685;
	setAttr -s 6 ".ed[0:5]"  4 3 0 2 1 0 3 2 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -3 -1 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface93" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.3123072385787964 -2.0471186637878418 0 ;
	setAttr ".sp" -type "double3" -3.3123072385787964 -2.0471186637878418 0 ;
createNode mesh -n "polySurfaceShape94" -p "polySurface93";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.26620466 0.31442794
		 0.26355016 0.35971496 0.24258815 0.3783612 0.22162609 0.35971493 0.21897157 0.31442794
		 0.24258815 0.29227519;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.046257794 -0.073207304 
		0.15542746 -0.044791553 0.074113585 0.15542755 -0.086537756 0.14002104 3.7029217e-008 
		-0.044791553 0.074113555 -0.15542744 0.046257794 -0.073207304 -0.15542755 0.086537756 
		-0.14002104 -2.9750876e-008;
	setAttr -s 6 ".vt[0:5]"  -3.15209389 -2.30067134 0.53832126 -3.46744227 -1.79042709 0.53832155
		 -3.61202979 -1.56215739 1.2825028e-007 -3.46744227 -1.79042721 -0.5383212 -3.15209389 -2.30067134 -0.53832155
		 -3.012584686 -2.53207994 -1.0304182e-007;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface94" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.1551216840744019 -1.9499723315238953 1.200268030166626 ;
	setAttr ".sp" -type "double3" -3.1551216840744019 -1.9499723315238953 1.200268030166626 ;
createNode mesh -n "polySurfaceShape95" -p "polySurface94";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.31657714 0.33091295
		 0.30997986 0.37456405 0.28834119 0.38793689 0.26998669 0.36082089 0.27264154 0.31552744
		 0.29728198 0.30008847;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.083592884 -0.050055761 
		0.14527045 -0.0073872828 0.097153343 0.1452705 -0.089820832 0.14533326 -0.00063506217 
		-0.084291652 0.04971553 -0.14527038 0.0067705661 -0.097626321 -0.1452705 0.089820832 
		-0.14533326 -0.00063516543;
	setAttr -s 6 ".vt[0:5]"  -2.86559868 -2.12333989 1.70341063 -3.18070745 -1.61348283 1.70341074
		 -3.46621513 -1.44661224 1.1980685 -3.44706488 -1.77778316 0.69712573 -3.13167191 -2.2881 0.69712532
		 -2.84402823 -2.45333242 1.19806814;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface95" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.6705110669136047 1.0209383964538574 3.370922327041626 ;
	setAttr ".sp" -type "double3" -1.6705110669136047 1.0209383964538574 3.370922327041626 ;
createNode mesh -n "polySurfaceShape96" -p "polySurface95";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.37667185 0.60259181
		 0.37599003 0.55699652 0.39395645 0.53301823 0.41277805 0.55370456 0.41506973 0.59922844
		 0.39641309 0.62487274;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.11759308 0.089301109 -0.085424758 
		-0.14791705 -0.078022793 -0.051133949 -0.028714973 -0.16908503 0.035471443 0.1175611 
		-0.090340666 0.085424758 0.14791705 0.078104794 0.052113093 0.028822361 0.16908503 
		-0.034414303;
	setAttr -s 6 ".vt[0:5]"  -2.07779336 1.33023179 3.075054646 -2.18282008 0.75070733 3.19382048
		 -1.76996505 0.4353143 3.49377728 -1.26333952 0.70804453 3.66679001 -1.15820205 1.29145348 3.55141544
		 -1.57068515 1.6065625 3.25172877;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 1 0 0 2 1 0 3 2 0 4 3 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -3 -4 -5 -6 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface96" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.63090347126126289 1.0209381729364395 3.7104068994522095 ;
	setAttr ".sp" -type "double3" -0.63090347126126289 1.0209381729364395 3.7104068994522095 ;
createNode mesh -n "polySurfaceShape97" -p "polySurface96";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.43401623 0.6248728
		 0.41535956 0.5992285 0.4176513 0.55370456 0.43647283 0.53301817 0.45443919 0.55699652
		 0.45375744 0.60259181;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.0028018006 0.16908506 
		-0.04517911 -0.15001093 0.078104861 -0.045179177 -0.14503245 -0.090340599 -0.00038662693 
		0.0026691095 -0.16908506 0.045179177 0.15001093 -0.078022778 0.045179177 0.14563398 
		0.089301109 -0.00038662693;
	setAttr -s 6 ".vt[0:5]"  -0.64060748 1.60656238 3.55392957 -1.15046465 1.29145348 3.55392933
		 -1.13322175 0.70804453 3.70906782 -0.62165904 0.43531397 3.86688447 -0.11134229 0.75070715 3.86688447
		 -0.1265018 1.33023155 3.70906782;
	setAttr -s 6 ".ed[0:5]"  1 0 0 0 5 0 2 1 0 3 2 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -3 -4 -5 -6 -2
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface97" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.202178031206131 0.00024431943893432617 3.6999374628067017 ;
	setAttr ".sp" -type "double3" -1.202178031206131 0.00024431943893432617 3.6999374628067017 ;
createNode mesh -n "polySurfaceShape98" -p "polySurface97";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.43369347 0.47721004
		 0.43364254 0.52277267 0.41521466 0.54491735 0.39678678 0.52277267 0.39673585 0.47721004
		 0.41521466 0.45501456;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.14419748 -0.086619705 0.046027258 
		0.14370899 0.08661551 0.047521036 -0.00065986952 0.17091124 0.0020268916 -0.14419748 
		0.08661551 -0.046025466 -0.14371458 -0.086619705 -0.047521036 0.0002976628 -0.17091124 
		-0.00091991253;
	setAttr -s 6 ".vt[0:5]"  -0.7027517 -0.29976204 3.85935235 -0.70444357 0.30023617 3.86452603
		 -1.20446348 0.59219348 3.70695758 -1.70160437 0.30023617 3.54052877 -1.69993186 -0.29976204 3.53534889
		 -1.20114708 -0.59170485 3.69675136;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -2 -1 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface98" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.2869935631752014 -2.9802322387695313e-008 3.1477766036987305 ;
	setAttr ".sp" -type "double3" -2.2869935631752014 -2.9802322387695313e-008 3.1477766036987305 ;
createNode mesh -n "polySurfaceShape99" -p "polySurface98";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.35498422 0.52278697
		 0.35313582 0.47722635 0.37109971 0.45325142 0.38913178 0.47721305 0.39098018 0.52277368
		 0.37301633 0.54674858;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.113786 0.086537726 -0.081605025 
		-0.12569982 -0.086689889 -0.091326214 -0.0065146447 -0.17773922 -0.0047332109 0.11277282 
		-0.086537719 0.082999535 0.12569982 0.086689904 0.091326214 0.0065146792 0.17773922 
		0.0047331424;
	setAttr -s 6 ".vt[0:5]"  -2.68109012 0.2997224 2.86513853 -2.72235346 -0.30024949 2.8314693
		 -2.30955696 -0.61559778 3.13138318 -1.89640617 -0.29972243 3.43524456 -1.85163367 0.30024949 3.46408391
		 -2.26443005 0.61559772 3.16416979;
	setAttr -s 6 ".ed[0:5]"  5 4 0 4 3 0 0 5 0 1 0 0 2 1 0 3 2 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -5 -6 -2 -1 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface99" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0 0 3.8923581838607788 ;
	setAttr ".sp" -type "double3" 0 0 3.8923581838607788 ;
createNode mesh -n "polySurfaceShape100" -p "polySurface99";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.45741302 0.54674858
		 0.43944907 0.52277368 0.44129753 0.47721305 0.45932958 0.45325142 0.47729346 0.47722635
		 0.47544503 0.52278697;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.0080526453 0.17773923 
		-0.00043095837 -0.15537354 0.086689897 -0.00043088954 -0.14002097 -0.086537719 0.00043095837 
		0.0080526453 -0.17773923 -0.00043095837 0.15537354 -0.086689897 -0.00043088954 0.14002097 
		0.086537719 0.00043095837;
	setAttr -s 6 ".vt[0:5]"  -0.027890246 0.61559784 3.89086556 -0.53813452 0.30024949 3.8908658
		 -0.48496103 -0.2997224 3.8938508 0.027890246 -0.61559784 3.89086556 0.53813452 -0.30024949 3.8908658
		 0.48496103 0.2997224 3.8938508;
	setAttr -s 6 ".ed[0:5]"  1 0 0 2 1 0 0 5 0 3 2 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -2 -4 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface100" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.7399842143058777 -1.0753669440746307 3.3109110593795776 ;
	setAttr ".sp" -type "double3" -1.7399842143058777 -1.0753669440746307 3.3109110593795776 ;
createNode mesh -n "polySurfaceShape101" -p "polySurface100";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.41110447 0.39282873
		 0.41061324 0.43843952 0.39262569 0.46240455 0.37376723 0.44194275 0.37228614 0.39648068
		 0.39111352 0.37076181;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.14260466 -0.089805663 0.044375498 
		0.12410302 0.076699123 0.088535495 -0.016549185 0.16771069 0.044375565 -0.14260466 
		0.089800641 -0.0453627 -0.12462777 -0.077024981 -0.088535495 0.016546087 -0.16771069 
		-0.0453627;
	setAttr -s 6 ".vt[0:5]"  -1.24607456 -1.38640785 3.46460509 -1.3101548 -0.8097204 3.61755276
		 -1.79730213 -0.49450284 3.46460533 -2.23389387 -0.76434344 3.15379786 -2.1716311 -1.34214211 3.0042693615
		 -1.68267703 -1.65623105 3.15379786;
	setAttr -s 6 ".ed[0:5]"  2 1 0 3 2 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -1 -2 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface101" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.53769229725003242 -1.0753667652606964 3.6999372243881226 ;
	setAttr ".sp" -type "double3" -0.53769229725003242 -1.0753667652606964 3.6999372243881226 ;
createNode mesh -n "polySurfaceShape102" -p "polySurface101";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.45814317 0.39648071
		 0.45666209 0.44194278 0.43780363 0.46240455 0.41981605 0.43843955 0.41932485 0.39282873
		 0.43931574 0.37076181;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.15265355 -0.077024966 0.0020269603 
		0.14182086 0.089800641 0.047521036 -0.012906968 0.16771071 0.046027258 -0.15265355 
		0.076699086 -0.00091984367 -0.14166519 -0.089805685 -0.047521036 0.013065168 -0.16771071 
		-0.046025399;
	setAttr -s 6 ".vt[0:5]"  -0.0089784665 -1.34214187 3.70695758 -0.046497356 -0.76434326 3.86452579
		 -0.58239543 -0.4945026 3.85935211 -1.066406131 -0.80972034 3.69675136 -1.028348088 -1.38640773 3.53534865
		 -0.49244124 -1.65623093 3.54052877;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface102" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.6897042989730835 -1.0209383368492126 2.6309466361999512 ;
	setAttr ".sp" -type "double3" -2.6897042989730835 -1.0209383368492126 2.6309466361999512 ;
createNode mesh -n "polySurfaceShape103" -p "polySurface102";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.33133799 0.44629544
		 0.32904628 0.40077156 0.34770292 0.37512726 0.36744419 0.39740819 0.36812598 0.44300348
		 0.35015953 0.4669818;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.11757709 0.090340644 -0.085560784 
		-0.095276289 -0.078104816 -0.12472495 0.023818359 -0.16908501 -0.038197555 0.11757709 
		-0.089301124 0.085288733 0.094335213 0.078022778 0.12472495 -0.024866894 0.16908501 
		0.038119562;
	setAttr -s 6 ".vt[0:5]"  -3.096931219 -0.70804453 2.33460784 -3.019692659 -1.29145348 2.19896317
		 -2.60720968 -1.60656238 2.49864984 -2.28247738 -1.33023179 2.9263432 -2.36297536 -0.75070733 3.062930107
		 -2.77583051 -0.4353143 2.76297331;
	setAttr -s 6 ".ed[0:5]"  1 0 0 2 1 0 5 4 0 4 3 0 0 5 0 3 2 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -2 -6 -4 -3 -5
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface103" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.63090341165661812 -1.0209381729364395 3.7104068994522095 ;
	setAttr ".sp" -type "double3" 0.63090341165661812 -1.0209381729364395 3.7104068994522095 ;
createNode mesh -n "polySurfaceShape104" -p "polySurface103";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.4802697 0.46698183
		 0.46230328 0.44300348 0.4629851 0.39740822 0.48272637 0.37512726 0.50138313 0.40077156
		 0.49909133 0.44629547;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.0026690923 0.16908506 
		0.045179177 -0.15001091 0.078022778 0.045179177 -0.14563397 -0.089301109 -0.00038662693 
		0.0028018006 -0.16908506 -0.04517911 0.15001091 -0.078104861 -0.045179177 0.14503247 
		0.090340599 -0.00038662693;
	setAttr -s 6 ".vt[0:5]"  0.62165904 -0.43531397 3.86688447 0.11134229 -0.75070715 3.86688447
		 0.1265018 -1.33023155 3.70906782 0.64060742 -1.60656238 3.55392957 1.15046453 -1.29145348 3.55392933
		 1.13322175 -0.70804453 3.70906782;
	setAttr -s 6 ".ed[0:5]"  1 0 0 2 1 0 0 5 0 3 2 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -2 -4 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface104" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.1168391704559326 -1.9499725103378296 2.6309466361999512 ;
	setAttr ".sp" -type "double3" -2.1168391704559326 -1.9499725103378296 2.6309466361999512 ;
createNode mesh -n "polySurfaceShape105" -p "polySurface104";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.38516119 0.31552744
		 0.38781607 0.36082086 0.36946157 0.38793683 0.3478229 0.37456402 0.34122565 0.33091295
		 0.36052075 0.30008847;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.14034787 -0.097626269 0.038119562 
		0.11220816 0.049715545 0.12472495 -0.027056793 0.1453332 0.085288733 -0.14034787 
		0.097153358 -0.038197555 -0.11223353 -0.050055709 -0.12472495 0.028455507 -0.1453332 
		-0.085560784;
	setAttr -s 6 ".vt[0:5]"  -1.63074589 -2.2881 2.76297331 -1.72820747 -1.77778327 3.062930107
		 -2.21055007 -1.4466126 2.9263432 -2.60293245 -1.61348295 2.49864984 -2.50555873 -2.12333989 2.19896317
		 -2.018283844 -2.45333242 2.33460784;
	setAttr -s 6 ".ed[0:5]"  4 3 0 2 1 0 3 2 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -3 -1 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface105" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.0227746963500977 -2.047118604183197 3.1477764844894409 ;
	setAttr ".sp" -type "double3" -1.0227746963500977 -2.047118604183197 3.1477764844894409 ;
createNode mesh -n "polySurfaceShape106" -p "polySurface105";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.43883115 0.31442791
		 0.43617672 0.35971493 0.41521466 0.3783612 0.39425257 0.35971493 0.39159808 0.31442794
		 0.41521466 0.29227519;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.16188818 -0.073207319 0.0047331764 
		0.1337525 0.074113607 0.091326244 -0.026968131 0.14002106 0.082999572 -0.16188818 
		0.07411357 -0.0047331764 -0.13375247 -0.073207319 -0.091326244 0.026515057 -0.14002106 
		-0.081605054;
	setAttr -s 6 ".vt[0:5]"  -0.46207678 -2.30067134 3.16416979 -0.55952442 -1.79042697 3.46408391
		 -1.11617851 -1.56215727 3.43524456 -1.58347261 -1.79042709 3.13138318 -1.48602486 -2.30067134 2.83146906
		 -0.93094009 -2.53207994 2.86513829;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface106" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.16616277396678925 -1.9499723315238953 3.3709224462509155 ;
	setAttr ".sp" -type "double3" 0.16616277396678925 -1.9499723315238953 3.3709224462509155 ;
createNode mesh -n "polySurfaceShape107" -p "polySurface106";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.48920366 0.33091295
		 0.48260641 0.37456405 0.46096772 0.38793686 0.44261324 0.36082089 0.44526812 0.31552741
		 0.46990854 0.30008847;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.16409998 -0.050055761 -0.034414269 
		0.13598555 0.097153343 0.05211306 -0.028252235 0.14533326 0.085424721 -0.16409998 
		0.049715564 0.03547141 -0.1359603 -0.097626321 -0.051133912 0.027260041 -0.14533326 
		-0.085424721;
	setAttr -s 6 ".vt[0:5]"  0.73452121 -2.12333989 3.25172901 0.63714719 -1.61348283 3.55141544
		 0.068311475 -1.44661224 3.66679001 -0.40219566 -1.77778304 3.49377728 -0.30473417 -2.2881 3.19382071
		 0.26057762 -2.45333242 3.075054884;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface107" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.6897042989730835 1.0209383964538574 2.6309467554092407 ;
	setAttr ".sp" -type "double3" 2.6897042989730835 1.0209383964538574 2.6309467554092407 ;
createNode mesh -n "polySurfaceShape108" -p "polySurface107";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.54929841 0.60259181
		 0.54861659 0.55699652 0.56658304 0.53301823 0.58540463 0.55370456 0.58769637 0.5992285
		 0.5690397 0.62487274;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.11757709 0.089301109 0.085288696 
		-0.094335213 -0.078022793 0.12472492 0.024866894 -0.16908503 0.038119528 0.11757709 
		-0.090340666 -0.085560814 0.095276289 0.078104794 -0.12472492 -0.023818359 0.16908503 
		-0.038197588;
	setAttr -s 6 ".vt[0:5]"  2.28247738 1.33023179 2.9263432 2.36297536 0.75070733 3.062930107
		 2.77583051 0.4353143 2.76297331 3.096931219 0.70804453 2.33460784 3.019692659 1.29145348 2.1989634
		 2.60720968 1.6065625 2.49864984;
	setAttr -s 6 ".ed[0:5]"  5 4 0 0 5 0 1 0 0 2 1 0 3 2 0 4 3 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -3 -4 -5 -6 -1 -2
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface108" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.3338469266891479 1.0209382176399231 1.7451992034912109 ;
	setAttr ".sp" -type "double3" 3.3338469266891479 1.0209382176399231 1.7451992034912109 ;
createNode mesh -n "polySurfaceShape109" -p "polySurface108";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.60664278 0.62487274
		 0.58798611 0.5992285 0.59027785 0.55370456 0.60909939 0.53301817 0.62706584 0.55699652
		 0.62638402 0.60259181;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.043833744 0.16908506 -0.010890984 
		-0.089323893 0.078104846 0.12911321 -0.045185234 -0.090340614 0.1382201 0.043792717 
		-0.16908506 0.011828175 0.089323893 -0.078022793 -0.12830225 0.044635635 0.089301094 
		-0.1382201;
	setAttr -s 6 ".vt[0:5]"  3.18202925 1.60656238 1.7074784 3.024474621 1.29145348 2.19238138
		 3.17734838 0.70804453 2.22392297 3.48552251 0.43531406 1.78616595 3.64321923 0.75070715 1.30082583
		 3.48844194 1.33023155 1.26647544;
	setAttr -s 6 ".ed[0:5]"  0 5 0 1 0 0 2 1 0 3 2 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -2 -3 -4 -5 -6 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface109" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.1473532915115356 0.00024431943893432617 2.2866839170455933 ;
	setAttr ".sp" -type "double3" 3.1473532915115356 0.00024431943893432617 2.2866839170455933 ;
createNode mesh -n "polySurfaceShape110" -p "polySurface109";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.60632002 0.47721004
		 0.60626906 0.52277267 0.58784121 0.54491735 0.56941336 0.52277267 0.56936246 0.47721004
		 0.58784121 0.45501456;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.088334903 -0.086619705 
		-0.12291703 0.089604549 0.08661551 -0.12199086 0.0017246252 0.17091124 0.0012536377 
		-0.088331394 0.08661551 0.12291703 -0.089604549 -0.08661969 0.12199558 -0.00078203063 
		-0.17091124 -0.00056767004;
	setAttr -s 6 ".vt[0:5]"  3.45330024 -0.29976204 1.86096215 3.45769763 0.30023617 1.86416996
		 3.15332651 0.59219348 2.29102588 2.8414185 0.30023617 2.71240568 2.83700895 -0.29976201 2.70921421
		 3.14464474 -0.59170485 2.2847178;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -2 -1 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface110" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.2869935631752014 2.9802322387695313e-008 3.1477766036987305 ;
	setAttr ".sp" -type "double3" 2.2869935631752014 2.9802322387695313e-008 3.1477766036987305 ;
createNode mesh -n "polySurfaceShape111" -p "polySurface110";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.52761084 0.52278697
		 0.52576244 0.47722635 0.54372633 0.45325142 0.56175834 0.47721305 0.56360674 0.52277368
		 0.54564291 0.54674858;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.11277282 0.086537719 0.082999535 
		-0.12569982 -0.086689904 0.091326214 -0.0065146792 -0.17773922 0.0047331424 0.113786 
		-0.086537726 -0.081605025 0.12569982 0.086689889 -0.091326214 0.0065146447 0.17773922 
		-0.0047332109;
	setAttr -s 6 ".vt[0:5]"  1.89640617 0.29972243 3.43524456 1.85163367 -0.30024949 3.46408391
		 2.26443005 -0.61559772 3.16416979 2.68109012 -0.2997224 2.86513853 2.72235346 0.30024949 2.8314693
		 2.30955696 0.61559778 3.13138318;
	setAttr -s 6 ".ed[0:5]"  5 4 0 4 3 0 0 5 0 1 0 0 2 1 0 3 2 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -5 -6 -2 -1 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface111" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.7004332542419434 -2.9802322387695313e-008 1.2023435831069946 ;
	setAttr ".sp" -type "double3" 3.7004332542419434 -2.9802322387695313e-008 1.2023435831069946 ;
createNode mesh -n "polySurfaceShape112" -p "polySurface111";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.63003963 0.54674858
		 0.61207569 0.52277368 0.61392409 0.47721305 0.63195616 0.45325139 0.64992005 0.47722635
		 0.64807159 0.52278697;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.0024883449 0.17773923 
		0.0076585379 -0.048013054 0.086689904 0.14776902 -0.042449109 -0.086537719 0.13343419 
		0.0024884138 -0.17773923 -0.0076585035 0.048013054 -0.086689889 -0.14776902 0.044088617 
		0.086537734 -0.13290152;
	setAttr -s 6 ".vt[0:5]"  3.6918149 0.61559778 1.22886884 3.53414059 0.30024949 1.71413994
		 3.55341125 -0.29972243 1.66449142 3.70905185 -0.61559784 1.17581844 3.86672592 -0.30024949 0.69054723
		 3.85313368 0.29972243 0.74204069;
	setAttr -s 6 ".ed[0:5]"  1 0 0 2 1 0 0 5 0 3 2 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -2 -4 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface112" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.6108981370925903 -1.0753669440746307 2.6774227619171143 ;
	setAttr ".sp" -type "double3" 2.6108981370925903 -1.0753669440746307 2.6774227619171143 ;
createNode mesh -n "polySurfaceShape113" -p "polySurface112";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.58373106 0.39282873
		 0.58323985 0.43843955 0.56525218 0.46240452 0.54639381 0.44194275 0.5449127 0.39648068
		 0.56374013 0.37076181;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.086351968 -0.089805633 
		-0.12175977 0.12263329 0.076699123 -0.090517506 0.037170738 0.16771069 0.029604545 
		-0.087128662 0.089800641 0.12175977 -0.12263329 -0.077024981 0.091321528 -0.037948396 
		-0.16771069 -0.029601585;
	setAttr -s 6 ".vt[0:5]"  2.9099772 -1.38640773 2.25570917 3.03563714 -0.8097204 2.3639164
		 2.73963857 -0.49450284 2.77995777 2.309129 -0.76434344 3.099136353 2.18615913 -1.34214211 2.99371386
		 2.47946429 -1.65623105 2.574898;
	setAttr -s 6 ".ed[0:5]"  2 1 0 3 2 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -1 -2 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface113" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.3527770042419434 -1.0753667801618576 1.655311644077301 ;
	setAttr ".sp" -type "double3" 3.3527770042419434 -1.0753667801618576 1.655311644077301 ;
createNode mesh -n "polySurfaceShape114" -p "polySurface113";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.63076973 0.39648071
		 0.62928867 0.44194275 0.61043024 0.46240455 0.59244269 0.43843952 0.59195149 0.39282873
		 0.61194241 0.37076181;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.049076181 -0.077024959 
		-0.14472683 0.088996194 0.089800641 -0.12036586 0.039762028 0.16771071 0.026327441 
		-0.048071429 0.076699093 0.14472683 -0.088996194 -0.089805678 0.11987574 -0.039759483 
		-0.16771071 -0.026819389;
	setAttr -s 6 ".vt[0:5]"  3.52275181 -1.34214187 1.1540519 3.66101432 -0.76434326 1.23842585
		 3.49049234 -0.49450263 1.74649644 3.18628216 -0.80972034 2.15657139 3.04453969 -1.38640773 2.070499897
		 3.21507049 -1.65623093 1.56242299;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface114" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.6705110669136047 -1.0209383368492126 3.370922327041626 ;
	setAttr ".sp" -type "double3" 1.6705110669136047 -1.0209383368492126 3.370922327041626 ;
createNode mesh -n "polySurfaceShape115" -p "polySurface114";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.50396454 0.44629544
		 0.50167286 0.40077156 0.52032954 0.37512723 0.54007077 0.39740819 0.54075259 0.44300348
		 0.52278608 0.4669818;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.1175611 0.090340644 0.085424758 
		-0.14791705 -0.078104816 0.052113093 -0.028822361 -0.16908501 -0.034414303 0.11759308 
		-0.089301124 -0.085424758 0.14791705 0.078022778 -0.051133949 0.028714973 0.16908501 
		0.035471443;
	setAttr -s 6 ".vt[0:5]"  1.26333952 -0.70804453 3.66679001 1.15820205 -1.29145348 3.55141544
		 1.57068515 -1.60656238 3.25172877 2.07779336 -1.33023179 3.075054646 2.18282008 -0.75070733 3.19382048
		 1.76996505 -0.4353143 3.49377728;
	setAttr -s 6 ".ed[0:5]"  1 0 0 2 1 0 5 4 0 4 3 0 0 5 0 3 2 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -2 -6 -4 -3 -5
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface115" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.7221711874008179 -1.0209381878376007 0.54655393515713513 ;
	setAttr ".sp" -type "double3" 3.7221711874008179 -1.0209381878376007 0.54655393515713513 ;
createNode mesh -n "polySurfaceShape116" -p "polySurface115";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.65289634 0.46698183
		 0.63492996 0.44300351 0.63561165 0.39740822 0.65535289 0.37512723 0.67400962 0.40077156
		 0.67171788 0.44629547;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.042603821 0.16908506 0.016499596 
		-0.0029272886 0.078022785 0.15662999 -0.044910435 -0.089301102 0.13838667 -0.041641541 
		-0.16908506 -0.016625799 0.0038486123 -0.078104861 -0.15662999 0.044910435 0.090340599 
		-0.13805357;
	setAttr -s 6 ".vt[0:5]"  3.86972904 -0.435314 0.6037001 3.71203256 -0.75070715 1.08904016
		 3.5666244 -1.33023155 1.025854588 3.57794619 -1.60656238 0.48897067 3.73550081 -1.29145348 0.0040677101
		 3.87771797 -0.70804453 0.068406962;
	setAttr -s 6 ".ed[0:5]"  5 4 0 4 3 0 1 0 0 2 1 0 0 5 0 3 2 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -3 -4 -6 -2 -1 -5
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface116" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.8480260372161865 -1.9499725103378296 2.8261990547180176 ;
	setAttr ".sp" -type "double3" 1.8480260372161865 -1.9499725103378296 2.8261990547180176 ;
createNode mesh -n "polySurfaceShape117" -p "polySurface116";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.55778778 0.31552741
		 0.56044269 0.36082086 0.54208821 0.38793683 0.52044946 0.37456402 0.51385224 0.33091295
		 0.53314734 0.30008847;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.079627655 -0.097626269 
		-0.12168714 0.15329866 0.049715545 -0.068162121 0.072757311 0.1453332 0.052100223 
		-0.079693988 0.097153358 0.12168714 -0.15329866 -0.050055709 0.068210378 -0.072575957 
		-0.1453332 -0.053490467;
	setAttr -s 6 ".vt[0:5]"  2.12381554 -2.2881 2.404737 2.3789742 -1.77778327 2.59012032
		 2.10002017 -1.4466126 3.0066475868 1.57200682 -1.61348295 3.24766111 1.31707788 -2.12333989 3.062444925
		 1.59666002 -2.45333242 2.64093542;
	setAttr -s 6 ".ed[0:5]"  4 3 0 2 1 0 3 2 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -3 -1 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface117" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.6776587963104248 -2.0471186637878418 1.9454327821731567 ;
	setAttr ".sp" -type "double3" 2.6776587963104248 -2.0471186637878418 1.9454327821731567 ;
createNode mesh -n "polySurfaceShape118" -p "polySurface117";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.61145777 0.31442794
		 0.60880333 0.35971496 0.58784121 0.3783612 0.56687915 0.35971493 0.56422466 0.31442794
		 0.58784121 0.29227519;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.054527715 -0.073207304 
		-0.15250216 0.12818825 0.074113622 -0.098984785 0.070603654 0.14002104 0.051296506 
		-0.054527782 0.074113585 0.15250216 -0.12818825 -0.073207304 0.098984785 -0.069417447 
		-0.14002104 -0.05043466;
	setAttr -s 6 ".vt[0:5]"  2.86651492 -2.30067134 1.41724324 3.12163734 -1.79042697 1.6026001
		 2.92219377 -1.56215739 2.12309766 2.48880243 -1.79042709 2.47362232 2.23368025 -2.30067134 2.28826547
		 2.43723226 -2.53207994 1.77075291;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 4 3 0 0 5 0 1 0 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -2 -1 -3 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface118" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.2589110136032104 -1.9499723315238953 0.8842078298330307 ;
	setAttr ".sp" -type "double3" 3.2589110136032104 -1.9499723315238953 0.8842078298330307 ;
createNode mesh -n "polySurfaceShape119" -p "polySurface118";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.66183025 0.33091295
		 0.65523303 0.37456402 0.63359427 0.38793689 0.61523986 0.36082089 0.61789471 0.31552741
		 0.64253509 0.30008847;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.017510209 -0.050055761 
		-0.16686629 0.091114774 0.097153343 -0.11338947 0.072043844 0.14533326 0.053103846 
		-0.017443851 0.049715564 0.16686629 -0.091114774 -0.097626321 0.11334134 -0.073289394 
		-0.14533326 -0.052486863;
	setAttr -s 6 ".vt[0:5]"  3.31955743 -2.12333989 0.3062683 3.57448602 -1.61348283 0.49148467
		 3.50843406 -1.44661224 1.068132401 3.19849443 -1.77778304 1.46214736 2.94333601 -2.2881 1.27676427
		 3.0050740242 -2.45333242 0.70242018;
	setAttr -s 6 ".ed[0:5]"  1 0 0 3 2 0 2 1 0 4 3 0 0 5 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -3 -2 -4 -6 -5
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface119" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.752195805311203 -3.7872791290283203 0.54655364551581442 ;
	setAttr ".sp" -type "double3" -0.752195805311203 -3.7872791290283203 0.54655364551581442 ;
createNode mesh -n "polySurfaceShape120" -p "polySurface119";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.35352445 0.14800224
		 0.30427828 0.14800227 0.25258741 0.12331274 0.32210541 0.076854914 0.43040058 0.076854914
		 0.40521535 0.12331274;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.068261415 0.037941478 
		0.15663001 -0.17007211 0.037941478 0.016499577 -0.10067245 0.00066276931 -0.13805357 
		0.068353139 -0.037941478 -0.15663001 0.17007211 -0.037941478 -0.01662581 0.10017305 
		0.00066276931 0.13838665;
	setAttr -s 6 ".vt[0:5]"  -0.98861843 -3.65586925 1.089039922 -1.34123862 -3.65586925 0.60369974
		 -1.10087371 -3.78498363 0.068406671 -0.51545548 -3.91868901 0.0040673693 -0.16315299 -3.91868901 0.48897034
		 -0.40524757 -3.78498363 1.02585423;
	setAttr -s 6 ".ed[0:5]"  0 5 0 1 0 0 2 1 0 3 2 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -2 -3 -4 -5 -6 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface120" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.75219553709030151 -3.7872791290283203 -0.54655393469147384 ;
	setAttr ".sp" -type "double3" -0.75219553709030151 -3.7872791290283203 -0.54655393469147384 ;
createNode mesh -n "polySurfaceShape121" -p "polySurface120";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.24525298 0.082282007
		 0.33837515 0.058792859 0.32091627 0.076854914 0.23258884 0.12331274 0.18089794 0.14800224
		 0.13165177 0.14800224;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.10017306 0.00066276931 
		-0.13838659 0.17007208 -0.037941478 0.016625868 0.068353057 -0.037941478 0.15663002 
		-0.10067253 0.00066276931 0.13805357 -0.17007208 0.037941478 -0.016499631 -0.068261385 
		0.037941478 -0.15663002;
	setAttr -s 6 ".vt[0:5]"  -0.40524727 -3.78498363 -1.025854349 -0.16315281 -3.91868901 -0.48897043
		 -0.51545548 -3.91868901 -0.00406759 -1.10087371 -3.78498363 -0.068406969 -1.34123826 -3.65586925 -0.60370022
		 -0.98861808 -3.65586925 -1.089040279;
	setAttr -s 6 ".ed[0:5]"  3 2 0 0 5 0 1 0 0 2 1 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -3 -4 -1 -5 -6 -2
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface121" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.7404977679252625 -3.4815421104431152 -2.6822090148925781e-007 ;
	setAttr ".sp" -type "double3" -1.7404977679252625 -3.4815421104431152 -2.6822090148925781e-007 ;
createNode mesh -n "polySurfaceShape122" -p "polySurface121";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.20943396 0.19955429
		 0.19250821 0.15646723 0.24258815 0.13057399 0.29266804 0.15646723 0.27574223 0.19955429
		 0.24258815 0.21558386;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.076863497 0.039960418 
		-0.15136427 0.077379957 -0.038918354 -0.15136133 0.15217489 -0.077819496 3.4239758e-008 
		0.077379882 -0.038918354 0.15136136 -0.076863565 0.039960418 0.15136427 -0.15217489 
		0.077819496 -7.5867295e-009;
	setAttr -s 6 ".vt[0:5]"  -2.0067136288 -3.34313965 -0.52424872 -1.47249317 -3.61633539 -0.52423853
		 -1.21344173 -3.75106907 -1.4963189e-007 -1.47249341 -3.61633539 0.52423811 -2.0067138672 -3.34313965 0.52424818
		 -2.26755381 -3.21201515 -2.9449745e-007;
	setAttr -s 6 ".ed[0:5]"  3 2 0 2 1 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -2 -1 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface122" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.6548840999603271 -3.3097681999206543 1.2023431062698364 ;
	setAttr ".sp" -type "double3" -1.6548840999603271 -3.3097681999206543 1.2023431062698364 ;
createNode mesh -n "polySurfaceShape123" -p "polySurface122";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.34421077 0.23939416
		 0.31359196 0.23939419 0.29095089 0.20430744 0.30428177 0.16009781 0.35352096 0.16009781
		 0.36685187 0.20430744;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.056065686 0.081713028 
		0.14776899 -0.15786198 0.081713095 0.0076585035 -0.097118661 -0.00073319027 -0.13290152 
		0.056065757 -0.081713095 -0.14776899 0.15786198 -0.081713095 -0.007658469 0.096385576 
		-0.00073319027 0.13343427;
	setAttr -s 6 ".vt[0:5]"  -1.84906697 -3.026756048 1.71413934 -2.20163727 -3.02675581 1.22886825
		 -1.9912535 -3.3123076 0.74204022 -1.46070099 -3.59278059 0.69054687 -1.10813093 -3.59278059 1.17581809
		 -1.32105374 -3.3123076 1.66449118;
	setAttr -s 6 ".ed[0:5]"  4 3 0 3 2 0 0 5 0 1 0 0 2 1 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -5 -2 -1 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface123" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.6548835039138794 -3.3097681999206543 -1.2023438811302185 ;
	setAttr ".sp" -type "double3" -1.6548835039138794 -3.3097681999206543 -1.2023438811302185 ;
createNode mesh -n "polySurfaceShape124" -p "polySurface123";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.11832435 0.20430741
		 0.13165526 0.16009781 0.18089445 0.16009778 0.1942253 0.20430741 0.17158426 0.23939416
		 0.14096545 0.23939419;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.096385539 -0.00073319027 
		-0.13343418 0.15786193 -0.081713095 0.0076585547 0.056065653 -0.081713095 0.14776905 
		-0.097118765 -0.00073319027 0.13290158 -0.15786193 0.081713028 -0.0076585207 -0.05606572 
		0.081713095 -0.14776905;
	setAttr -s 6 ".vt[0:5]"  -1.32105327 -3.3123076 -1.66449165 -1.10813046 -3.59278059 -1.17581856
		 -1.46070075 -3.59278059 -0.69054747 -1.99125326 -3.3123076 -0.74204075 -2.20163655 -3.026756048 -1.22886908
		 -1.8490665 -3.02675581 -1.7141403;
	setAttr -s 6 ".ed[0:5]"  2 1 0 3 2 0 0 5 0 1 0 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -1 -2 -5 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface124" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.6097856760025024 -2.8149776458740234 0.63222360610961914 ;
	setAttr ".sp" -type "double3" -2.6097856760025024 -2.8149776458740234 0.63222360610961914 ;
createNode mesh -n "polySurfaceShape125" -p "polySurface124";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.24833755 0.27876478
		 0.2490247 0.23322994 0.2814917 0.21531656 0.30637002 0.24780172 0.29553616 0.29028592
		 0.27059591 0.30411166;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.079700865 0.041409798 
		-0.14949039 0.04788629 -0.075731859 -0.14554045 0.12863421 -0.11774413 0.0018738997 
		0.079696804 -0.041406631 0.14949039 -0.048669662 0.074893758 0.14573449 -0.12863421 
		0.11774413 -0.0018709225;
	setAttr -s 6 ".vt[0:5]"  -2.88582873 -2.67155528 0.11446536 -2.44393206 -3.077274084 0.12814592
		 -2.16426253 -3.22278309 0.63871384 -2.33375669 -2.95838904 1.14998186 -2.7783525 -2.55558395 1.13697338
		 -3.055308819 -2.4071722 0.62574369;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 2 1 0 3 2 0 1 0 0 4 3 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -3 -4 -6 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface125" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.6097853183746338 -2.8149776458740234 -0.63222413510084152 ;
	setAttr ".sp" -type "double3" -2.6097853183746338 -2.8149776458740234 -0.63222413510084152 ;
createNode mesh -n "polySurfaceShape126" -p "polySurface125";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.18964006 0.29028589
		 0.17880614 0.24780172 0.20368452 0.21531653 0.2361515 0.23322994 0.23683868 0.27876478
		 0.21458034 0.30411166;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.048669625 0.074893691 
		-0.14573444 0.079696909 -0.041406631 -0.14949043 0.12863424 -0.11774413 -0.001873919 
		0.047886185 -0.075731859 0.1455404 -0.079700969 0.041409798 0.14949043 -0.12863424 
		0.11774413 0.0018709548;
	setAttr -s 6 ".vt[0:5]"  -2.77835202 -2.55558419 -1.13697374 -2.33375597 -2.95838904 -1.14998257
		 -2.16426206 -3.22278309 -0.63871443 -2.44393206 -3.077274084 -0.12814659 -2.88582873 -2.67155528 -0.1144657
		 -3.05530858 -2.4071722 -0.6257441;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 3 2 0 2 1 0 4 3 0 1 0 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -6 -4 -3 -5 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface126" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.404064953327179 -2.5252423286437988 1.7451988458633423 ;
	setAttr ".sp" -type "double3" -2.404064953327179 -2.5252423286437988 1.7451988458633423 ;
createNode mesh -n "polySurfaceShape127" -p "polySurface126";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.34096074 0.33051747
		 0.31684196 0.33051747 0.30173594 0.2934379 0.31358975 0.25149119 0.34421295 0.25149119
		 0.35606676 0.2934379;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.029921388 0.11480482 0.12911326 
		-0.13164037 0.11480489 -0.010890915 -0.099844173 -5.0251515e-006 -0.13822013 0.029829662 
		-0.11480489 -0.12830228 0.13164037 -0.11480489 0.01182814 0.10100143 -5.0251515e-006 
		0.13822013;
	setAttr -s 6 ".vt[0:5]"  -2.50769734 -2.12761712 2.19238114 -2.8599999 -2.12761688 1.70747828
		 -2.74987411 -2.52525973 1.26647496 -2.30075026 -2.92286777 1.30082536 -1.94813001 -2.92286777 1.78616548
		 -2.054247618 -2.52525973 2.22392273;
	setAttr -s 6 ".ed[0:5]"  2 1 0 1 0 0 0 5 0 4 3 0 3 2 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -2 -1 -5 -4 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface127" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.4040645360946655 -2.5252423286437988 -1.7451995611190796 ;
	setAttr ".sp" -type "double3" -2.4040645360946655 -2.5252423286437988 -1.7451995611190796 ;
createNode mesh -n "polySurfaceShape128" -p "polySurface127";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.12910946 0.29343793
		 0.14096327 0.25149119 0.17158641 0.25149119 0.18344028 0.2934379 0.16833426 0.33051747
		 0.14421545 0.33051747;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.10100146 -5.0251515e-006 
		-0.13822013 0.13164042 -0.11480489 -0.011828209 0.029829748 -0.11480489 0.1283022 
		-0.099844158 -5.0251515e-006 0.13822013 -0.13164042 0.11480489 0.010890984 -0.02992144 
		0.11480482 -0.12911318;
	setAttr -s 6 ".vt[0:5]"  -2.054247141 -2.52525973 -2.22392344 -1.94812942 -2.92286777 -1.78616643
		 -2.30074954 -2.92286777 -1.30082631 -2.74987364 -2.52525973 -1.26647568 -2.85999966 -2.12761688 -1.70747876
		 -2.50769711 -2.12761712 -2.19238162;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 4 3 0 2 1 0 3 2 0 1 0 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -6 -4 -5 -3 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface128" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.28764346241950989 -3.7872791290283203 0.88420757651329041 ;
	setAttr ".sp" -type "double3" 0.28764346241950989 -3.7872791290283203 0.88420757651329041 ;
createNode mesh -n "polySurfaceShape129" -p "polySurface128";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.52615106 0.14800224
		 0.47690478 0.14800227 0.42521393 0.12331274 0.43158969 0.076854914 0.53988498 0.076854914
		 0.57784194 0.12331274;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.12778881 0.037941478 0.11334127 
		-0.036944374 0.037941478 0.16686633 -0.16248748 0.00066276931 0.053103816 -0.12792294 
		-0.037941478 -0.11338954 0.036661856 -0.037941478 -0.16686633 0.16248748 0.00066276931 
		-0.052486908;
	setAttr -s 6 ".vt[0:5]"  0.73023856 -3.65586925 1.2767638 0.15968704 -3.65586925 1.46214724
		 -0.27513009 -3.78498363 1.068132043 -0.15541619 -3.91868901 0.49148419 0.41462138 -3.91868901 0.30626792
		 0.85041702 -3.78498363 0.70241976;
	setAttr -s 6 ".ed[0:5]"  3 2 0 4 3 0 0 5 0 1 0 0 2 1 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -5 -1 -2 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface129" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.53757206350564957 -3.4815421104431152 1.655311644077301 ;
	setAttr ".sp" -type "double3" -0.53757206350564957 -3.4815421104431152 1.655311644077301 ;
createNode mesh -n "polySurfaceShape130" -p "polySurface129";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.38206047 0.19955429
		 0.36513469 0.15646723 0.41521466 0.13057402 0.46529454 0.15646723 0.44836879 0.19955432
		 0.41521466 0.21558383;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.16778649 0.039960418 0.026327407 
		-0.12011987 -0.038918354 -0.12036593 0.04694625 -0.077819496 -0.1447269 0.16778649 
		-0.038918354 -0.026819389 0.12012544 0.039960489 0.11987574 -0.047103044 0.077819496 
		0.1447269;
	setAttr -s 6 ".vt[0:5]"  -1.11869872 -3.34313965 1.74649632 -0.95360589 -3.61633539 1.23842561
		 -0.37497425 -3.75106907 1.15405166 0.043554589 -3.61633539 1.56242299 -0.12151897 -3.34313941 2.070499897
		 -0.70071292 -3.21201515 2.15657163;
	setAttr -s 6 ".ed[0:5]"  2 1 0 1 0 0 3 2 0 0 5 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -2 -1 -3 -5 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface130" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.63259404525160789 -3.3097681999206543 1.9454327821731567 ;
	setAttr ".sp" -type "double3" 0.63259404525160789 -3.3097681999206543 1.9454327821731567 ;
createNode mesh -n "polySurfaceShape131" -p "polySurface130";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.51683736 0.23939416
		 0.48621848 0.23939419 0.46357742 0.20430744 0.4769083 0.16009781 0.52614754 0.16009781
		 0.53947842 0.20430744;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.12307135 0.081713028 0.098984785 
		-0.041638415 0.081713095 0.15250224 -0.15654826 -0.00073319027 0.051296506 -0.12335146 
		-0.081713095 -0.098984815 0.041358341 -0.081713095 -0.15250224 0.15654826 -0.00073319027 
		-0.05043466;
	setAttr -s 6 ".vt[0:5]"  1.058850288 -3.026756048 2.28826547 0.48837987 -3.02675581 2.47362256
		 0.090390913 -3.3123076 2.12309766 0.20536765 -3.59278059 1.60259998 0.7758382 -3.59278059 1.417243
		 1.17479718 -3.3123076 1.77075291;
	setAttr -s 6 ".ed[0:5]"  4 3 0 3 2 0 0 5 0 1 0 0 2 1 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -5 -2 -1 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface131" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.20518995821475983 -2.8149776458740234 2.6774228811264038 ;
	setAttr ".sp" -type "double3" -0.20518995821475983 -2.8149776458740234 2.6774228811264038 ;
createNode mesh -n "polySurfaceShape132" -p "polySurface131";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.42096403 0.27876478
		 0.42165121 0.23322994 0.45411825 0.21531653 0.47899663 0.24780172 0.46816269 0.29028592
		 0.4432224 0.30411166;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.16680211 0.041409798 0.02960458 
		-0.12361886 -0.075731859 -0.090517476 0.041533001 -0.11774413 -0.1217598 0.16680211 
		-0.041406631 -0.029601552 0.12356266 0.074893758 0.091321632 -0.041528855 0.11774413 
		0.1217598;
	setAttr -s 6 ".vt[0:5]"  -0.78290719 -2.67155528 2.77995801 -0.6333425 -3.077274084 2.36391664
		 -0.061340883 -3.22278309 2.25570917 0.37252727 -2.95838904 2.57489824 0.2227679 -2.55558395 2.99371433
		 -0.34902468 -2.4071722 3.099136591;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 2 1 0 3 2 0 1 0 0 4 3 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -3 -4 -6 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface132" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.4084877073764801 -2.8149776458740234 2.2866838574409485 ;
	setAttr ".sp" -type "double3" -1.4084877073764801 -2.8149776458740234 2.2866838574409485 ;
createNode mesh -n "polySurfaceShape133" -p "polySurface132";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.36226657 0.29028589
		 0.35143262 0.24780172 0.37631106 0.21531656 0.40877807 0.23322994 0.40946522 0.27876478
		 0.38720685 0.30411166;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.15342814 0.074893691 0.001253586 
		-0.11733285 -0.041406631 -0.12199087 0.038181283 -0.11774413 -0.12291705 0.15342814 
		-0.075731859 -0.00056758401 0.11775818 0.041409798 0.12199566 -0.037757501 0.11774413 
		0.12291705;
	setAttr -s 6 ".vt[0:5]"  -1.93988431 -2.55558419 2.29102564 -1.81486869 -2.95838904 1.86416984
		 -1.27624726 -3.22278309 1.86096203 -0.87709111 -3.077274084 2.28471804 -1.00063359737 -2.67155528 2.70921445
		 -1.53926039 -2.4071722 2.71240568;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 2 1 0 1 0 0 3 2 0 4 3 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -3 -5 -6 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface133" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.91750521957874298 -2.5252423286437988 2.8261992931365967 ;
	setAttr ".sp" -type "double3" 0.91750521957874298 -2.5252423286437988 2.8261992931365967 ;
createNode mesh -n "polySurfaceShape134" -p "polySurface133";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.51358736 0.33051747
		 0.48946849 0.33051747 0.47436249 0.29343793 0.48621634 0.25149119 0.5168395 0.25149119
		 0.52869338 0.2934379;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.11336899 0.11480482 0.068210311 
		-0.051215816 0.11480489 0.12168714 -0.16248751 -5.0251515e-006 0.05210029 -0.11298366 
		-0.11480489 -0.068162121 0.051749509 -0.11480489 -0.12168714 0.16248751 -5.0251515e-006 
		-0.053490538;
	setAttr -s 6 ".vt[0:5]"  1.31015742 -2.12761712 3.062444925 0.74011981 -2.12761688 3.24766135
		 0.35473159 -2.52525973 3.0066480637 0.5261876 -2.92286777 2.59012055 1.096739054 -2.92286777 2.40473723
		 1.48027885 -2.52525973 2.64093542;
	setAttr -s 6 ".ed[0:5]"  2 1 0 1 0 0 0 5 0 4 3 0 3 2 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -2 -1 -5 -4 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface134" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.92966686189174652 -3.7872791290283203 8.9406967163085938e-008 ;
	setAttr ".sp" -type "double3" 0.92966686189174652 -3.7872791290283203 8.9406967163085938e-008 ;
createNode mesh -n "polySurfaceShape135" -p "polySurface134";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.6987775 0.14800224
		 0.64953142 0.14800224 0.59784049 0.12331274 0.5410741 0.076854914 0.6493693 0.076854914
		 0.75046843 0.12331274;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.14732654 0.037941478 -0.086605303 
		0.14732654 0.037941478 0.086605407 0.00033699925 0.00066276931 0.17084944 -0.14732654 
		-0.037941478 0.08652734 -0.14732651 -0.037941478 -0.086527348 0.00033703365 0.00066276931 
		-0.17084944;
	setAttr -s 6 ".vt[0:5]"  1.43993068 -3.65586925 -0.29995641 1.43993068 -3.65586925 0.29995695
		 0.93083405 -3.78498363 0.59173518 0.41940305 -3.91868901 0.29968655 0.41940314 -3.91868901 -0.2996864
		 0.93083417 -3.78498363 -0.59173501;
	setAttr -s 6 ".ed[0:5]"  4 3 0 3 2 0 0 5 0 1 0 0 2 1 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -5 -2 -1 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface135" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.4073717296123505 -3.4815421104431152 1.0225176215171814 ;
	setAttr ".sp" -type "double3" 1.4073717296123505 -3.4815421104431152 1.0225176215171814 ;
createNode mesh -n "polySurfaceShape136" -p "polySurface135";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.55468708 0.19955429
		 0.53776133 0.15646723 0.58784121 0.13057402 0.63792115 0.15646723 0.62099534 0.19955429
		 0.58784121 0.21558383;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.026577812 0.039960418 
		0.16778608 -0.15136164 -0.038918354 0.077121675 -0.12290405 -0.077819496 -0.089295603 
		0.026574353 -0.038918354 -0.16778608 0.15136164 0.039960418 -0.077126443 0.12332009 
		0.077819496 0.089596719;
	setAttr -s 6 ".vt[0:5]"  1.31531978 -3.34313965 1.60364282 0.8831324 -3.61633539 1.28962767
		 0.98169494 -3.75106907 0.71324331 1.4994117 -3.61633539 0.44139242 1.93161106 -3.34313965 0.75539106
		 1.83448946 -3.21201515 1.33283484;
	setAttr -s 6 ".ed[0:5]"  2 1 0 1 0 0 3 2 0 0 5 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -2 -1 -3 -5 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface136" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.0455489754676819 -3.3097681999206543 3.2782554626464844e-007 ;
	setAttr ".sp" -type "double3" 2.0455489754676819 -3.3097681999206543 3.2782554626464844e-007 ;
createNode mesh -n "polySurfaceShape137" -p "polySurface136";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.68946379 0.23939416
		 0.65884501 0.23939419 0.636204 0.20430744 0.64953488 0.16009781 0.69877404 0.16009781
		 0.71210492 0.20430744;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.13221455 0.081713028 -0.08659301 
		0.13221455 0.081713095 0.086593106 0.00045314134 -0.00073319027 0.16460454 -0.13221455 
		-0.081713095 0.086593054 -0.13221455 -0.081713095 -0.086593069 0.00045314134 -0.00073319027 
		-0.16460454;
	setAttr -s 6 ".vt[0:5]"  2.50347257 -3.026756048 -0.29991359 2.50347257 -3.02675581 0.29991457
		 2.047118425 -3.3123076 0.57010633 1.58762538 -3.59278059 0.29991439 1.58762538 -3.59278059 -0.29991379
		 2.047118425 -3.3123076 -0.57010567;
	setAttr -s 6 ".ed[0:5]"  4 3 0 3 2 0 0 5 0 1 0 0 2 1 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -5 -2 -1 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface137" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.4842677116394043 -2.8149776458740234 1.0225179195404053 ;
	setAttr ".sp" -type "double3" 2.4842677116394043 -2.8149776458740234 1.0225179195404053 ;
createNode mesh -n "polySurfaceShape138" -p "polySurface137";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.59359068 0.27876478
		 0.5942778 0.23322994 0.62674487 0.21531656 0.65162325 0.24780172 0.64078933 0.29028592
		 0.61584902 0.30411166;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.023762772 0.041409798 
		0.16778606 -0.12466128 -0.075731859 0.089596666 -0.10333969 -0.11774413 -0.07712651 
		0.023018293 -0.041406631 -0.16778606 0.12466128 0.074893758 -0.089295566 0.10259364 
		0.11774413 0.07712169;
	setAttr -s 6 ".vt[0:5]"  2.40196562 -2.67155528 1.60364306 2.052504778 -3.077274084 1.33283496
		 2.12635183 -3.22278309 0.75539112 2.56399131 -2.95838904 0.44139278 2.91603065 -2.55558395 0.71324372
		 2.83959961 -2.4071722 1.28962803;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 2 1 0 3 2 0 1 0 0 4 3 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -3 -4 -6 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface138" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.7397544980049133 -2.8149776458740234 2.0465425848960876 ;
	setAttr ".sp" -type "double3" 1.7397544980049133 -2.8149776458740234 2.0465425848960876 ;
createNode mesh -n "polySurfaceShape139" -p "polySurface138";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.53489316 0.29028589
		 0.5240593 0.24780169 0.54893762 0.21531656 0.58140463 0.23322994 0.58209175 0.27876478
		 0.55983347 0.30411163;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.046287652 0.074893691 
		0.14620019 -0.15234606 -0.041406631 0.073786937 -0.10517038 -0.11774413 -0.074401967 
		0.046804074 -0.075731859 -0.14620019 0.15234606 0.041409798 -0.074401967 0.10516533 
		0.11774413 0.073786937;
	setAttr -s 6 ".vt[0:5]"  1.57943773 -2.55558419 2.55290532 1.21210563 -2.95838904 2.3021028
		 1.37549806 -3.22278309 1.78885221 1.90185988 -3.077274084 1.54017985 2.26740336 -2.67155528 1.78885221
		 2.10399342 -2.4071722 2.3021028;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 2 1 0 1 0 0 3 2 0 4 3 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -3 -5 -6 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface139" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.971685528755188 -2.5252423286437988 3.8743019104003906e-007 ;
	setAttr ".sp" -type "double3" 2.971685528755188 -2.5252423286437988 3.8743019104003906e-007 ;
createNode mesh -n "polySurfaceShape140" -p "polySurface139";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.68621385 0.33051747
		 0.66209507 0.33051747 0.64698905 0.2934379 0.65884292 0.25149119 0.68946606 0.25149119
		 0.70131981 0.2934379;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.099822335 0.11480489 -0.08652737 
		0.099822335 0.11480489 0.08652731 -0.00074355036 -5.0251515e-006 0.17084947 -0.099822335 
		-0.11480489 0.086605392 -0.099822335 -0.11480489 -0.086605325 -0.00074355036 -5.0251515e-006 
		-0.17084947;
	setAttr -s 6 ".vt[0:5]"  3.31741905 -2.12761688 -0.29968619 3.31741905 -2.12761688 0.29968676
		 2.96911025 -2.52525973 0.5917356 2.62595201 -2.92286777 0.29995719 2.62595201 -2.92286777 -0.29995617
		 2.96911025 -2.52525973 -0.59173483;
	setAttr -s 6 ".ed[0:5]"  0 5 0 1 0 0 2 1 0 4 3 0 3 2 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -2 -3 -5 -4 -6 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface140" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.2876436710357666 -3.7872791290283203 -0.88420742750167847 ;
	setAttr ".sp" -type "double3" 0.2876436710357666 -3.7872791290283203 -0.88420742750167847 ;
createNode mesh -n "polySurfaceShape141" -p "polySurface140";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.87140411 0.14800227
		 0.82215792 0.14800227 0.77046698 0.12331274 0.65055841 0.076854914 0.75885361 0.076854914
		 0.92309487 0.12331274;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.036944292 0.037941478 
		-0.16686635 0.12778889 0.037941478 -0.11334128 0.16248748 0.00066276931 0.052486934 
		0.03666183 -0.037941478 0.16686635 -0.12792294 -0.037941478 0.11338947 -0.16248748 
		0.00066276931 -0.05310386;
	setAttr -s 6 ".vt[0:5]"  0.15968753 -3.65586925 -1.46214712 0.73023903 -3.65586925 -1.27676368
		 0.8504172 -3.78498363 -0.70241952 0.4146215 -3.91868901 -0.30626774 -0.155416 -3.91868901 -0.49148428
		 -0.27512985 -3.78498363 -1.068132043;
	setAttr -s 6 ".ed[0:5]"  5 4 0 4 3 0 3 2 0 0 5 0 1 0 0 2 1 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -6 -3 -2 -1 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface141" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.4073718786239624 -3.4815421104431152 -1.022517204284668 ;
	setAttr ".sp" -type "double3" 1.4073718786239624 -3.4815421104431152 -1.022517204284668 ;
createNode mesh -n "polySurfaceShape142" -p "polySurface141";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.72731358 0.19955429
		 0.71038777 0.15646723 0.76046771 0.13057402 0.81054765 0.15646723 0.79362196 0.19955429
		 0.76046771 0.21558383;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.1513616 0.039960418 0.077126458 
		0.02657431 -0.038918354 0.16778609 -0.12290406 -0.077819496 0.089295566 -0.1513616 
		-0.038918354 -0.077121727 -0.026577752 0.039960418 -0.16778609 0.12332008 0.077819496 
		-0.089596696;
	setAttr -s 6 ".vt[0:5]"  1.93161106 -3.34313965 -0.75539058 1.4994117 -3.61633539 -0.44139194
		 0.98169506 -3.75106907 -0.71324301 0.8831327 -3.61633539 -1.28962743 1.31532013 -3.34313965 -1.60364246
		 1.83448958 -3.21201515 -1.33283436;
	setAttr -s 6 ".ed[0:5]"  2 1 0 1 0 0 3 2 0 0 5 0 4 3 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -2 -1 -3 -5 -6 -4
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface142" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.63259462639689445 -3.3097681999206543 -1.9454323649406433 ;
	setAttr ".sp" -type "double3" 0.63259462639689445 -3.3097681999206543 -1.9454323649406433 ;
createNode mesh -n "polySurfaceShape143" -p "polySurface142";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.86209041 0.23939416
		 0.83147156 0.23939419 0.80883056 0.20430744 0.82216132 0.16009781 0.87140065 0.16009781
		 0.88473147 0.20430744;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.041638333 0.081713028 
		-0.15250222 0.12307146 0.081713095 -0.098984838 0.15654823 -0.00073319027 0.050434642 
		0.041358311 -0.081713095 0.15250222 -0.12335146 -0.081713095 0.098984733 -0.15654823 
		-0.00073319027 -0.051296629;
	setAttr -s 6 ".vt[0:5]"  0.48838073 -3.026756048 -2.47362208 1.058851242 -3.02675581 -2.28826523
		 1.17479765 -3.3123076 -1.77075255 0.77583867 -3.59278059 -1.41724265 0.20536822 -3.59278059 -1.60259986
		 0.090391599 -3.3123076 -2.12309766;
	setAttr -s 6 ".ed[0:5]"  4 3 0 3 2 0 0 5 0 1 0 0 2 1 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -5 -2 -1 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface143" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.7397547960281372 -2.8149776458740234 -2.0465424060821533 ;
	setAttr ".sp" -type "double3" 1.7397547960281372 -2.8149776458740234 -2.0465424060821533 ;
createNode mesh -n "polySurfaceShape144" -p "polySurface143";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.76621717 0.27876478
		 0.76690429 0.23322994 0.7993713 0.21531656 0.82424968 0.24780172 0.81341583 0.29028592
		 0.78847551 0.30411166;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.15234597 0.041409798 0.074401982 
		0.046804089 -0.075731859 0.14620025 -0.10517037 -0.11774413 0.074402019 -0.15234597 
		-0.041406631 -0.073786922 -0.046287637 0.074893758 -0.14620025 0.10516531 0.11774413 
		-0.073786922;
	setAttr -s 6 ".vt[0:5]"  2.26740336 -2.67155528 -1.78885198 1.90186024 -3.077274084 -1.54017949
		 1.37549841 -3.22278309 -1.78885186 1.21210623 -2.95838904 -2.30210257 1.57943809 -2.55558395 -2.55290532
		 2.10399365 -2.4071722 -2.30210257;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 2 1 0 3 2 0 1 0 0 4 3 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -5 -3 -4 -6 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface144" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 2.4842677116394043 -2.8149776458740234 -1.0225173830986023 ;
	setAttr ".sp" -type "double3" 2.4842677116394043 -2.8149776458740234 -1.0225173830986023 ;
createNode mesh -n "polySurfaceShape145" -p "polySurface144";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.70751971 0.29028589
		 0.69668573 0.24780172 0.72156411 0.21531656 0.75403112 0.23322994 0.7547183 0.27876478
		 0.73246002 0.30411166;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.12466121 0.074893691 0.089295551 
		0.023018224 -0.041406631 0.16778615 -0.10333969 -0.11774413 0.07712651 -0.12466121 
		-0.075731859 -0.089596651 -0.023762703 0.041409798 -0.16778615 0.10259364 0.11774413 
		-0.077121712;
	setAttr -s 6 ".vt[0:5]"  2.91603041 -2.55558419 -0.71324325 2.56399107 -2.95838904 -0.44139194
		 2.12635183 -3.22278309 -0.75539058 2.052505016 -3.077274084 -1.33283436 2.40196586 -2.67155528 -1.60364282
		 2.83959961 -2.4071722 -1.28962755;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 2 1 0 1 0 0 3 2 0 4 3 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -3 -5 -6 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface145" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.91750587522983551 -2.5252423286437988 -2.826198935508728 ;
	setAttr ".sp" -type "double3" 0.91750587522983551 -2.5252423286437988 -2.826198935508728 ;
createNode mesh -n "polySurfaceShape146" -p "polySurface145";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.85884041 0.33051747
		 0.83472162 0.33051747 0.81961554 0.2934379 0.83146948 0.25149119 0.86209267 0.25149119
		 0.87394637 0.29343793;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.05121585 0.11480482 -0.12168718 
		0.11336894 0.11480489 -0.068210341 0.16248752 -5.0251515e-006 0.053490501 0.051749595 
		-0.11480489 0.12168718 -0.11298357 -0.11480489 0.068162084 -0.16248752 -5.0251515e-006 
		-0.052100327;
	setAttr -s 6 ".vt[0:5]"  0.74012035 -2.12761712 -3.24766111 1.3101579 -2.12761688 -3.062444687
		 1.48027956 -2.52525973 -2.64093518 1.096740007 -2.92286777 -2.40473676 0.52618855 -2.92286777 -2.59012032
		 0.35473219 -2.52525973 -3.0066478252;
	setAttr -s 6 ".ed[0:5]"  2 1 0 1 0 0 0 5 0 4 3 0 3 2 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -2 -1 -5 -4 -6 -3
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface146" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.53757167235016823 -3.4815421104431152 -1.6553117632865906 ;
	setAttr ".sp" -type "double3" -0.53757167235016823 -3.4815421104431152 -1.6553117632865906 ;
createNode mesh -n "polySurfaceShape147" -p "polySurface146";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.89994007 0.19955429
		 0.88301432 0.15646723 0.93309426 0.13057402 0.97310549 0.1385031 0.94994903 0.15539584
		 0.93309426 0.16769147;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.12012546 0.039960418 -0.11987563 
		0.16778651 -0.038918354 0.026819458 0.046946216 -0.077819496 0.14472693 -0.12011988 
		-0.038918354 0.1203659 -0.16778651 0.039960418 -0.026327441 -0.047102999 0.077819496 
		-0.14472693;
	setAttr -s 6 ".vt[0:5]"  -0.12151849 -3.34313965 -2.070499659 0.043555014 -3.61633539 -1.56242287
		 -0.37497398 -3.75106907 -1.15405166 -0.95360553 -3.61633539 -1.23842585 -1.11869836 -3.34313965 -1.74649656
		 -0.70071238 -3.21201515 -2.15657187;
	setAttr -s 6 ".ed[0:5]"  3 2 0 4 3 0 2 1 0 1 0 0 0 5 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -3 -1 -2 -6 -5
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface147" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -1.4084874093532562 -2.8149776458740234 -2.2866841554641724 ;
	setAttr ".sp" -type "double3" -1.4084874093532562 -2.8149776458740234 -2.2866841554641724 ;
createNode mesh -n "polySurfaceShape148" -p "polySurface147";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.075710967 0.27876478
		 0.076398179 0.23322994 0.10886519 0.21531653 0.13374357 0.24780172 0.12290965 0.29028592
		 0.097969398 0.30411166;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.11775819 0.041409727 -0.12199564 
		0.15342818 -0.075731859 0.00056760124 0.038181335 -0.11774413 0.12291703 -0.11733279 
		-0.041406631 0.12199076 -0.15342818 0.074893758 -0.0012536377 -0.037757482 0.11774413 
		-0.12291703;
	setAttr -s 6 ".vt[0:5]"  -1.00063323975 -2.67155552 -2.70921469 -0.87709063 -3.077274084 -2.28471828
		 -1.27624679 -3.22278309 -1.86096239 -1.81486821 -2.95838904 -1.86417055 -1.93988419 -2.55558395 -2.29102612
		 -1.53926003 -2.4071722 -2.71240592;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 3 2 0 4 3 0 2 1 0 1 0 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -6 -5 -3 -4 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface148" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -0.20518931746482849 -2.8149776458740234 -2.6774230003356934 ;
	setAttr ".sp" -type "double3" -0.20518931746482849 -2.8149776458740234 -2.6774230003356934 ;
createNode mesh -n "polySurfaceShape149" -p "polySurface148";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.88014621 0.29028589
		 0.86931235 0.24780172 0.89419073 0.21531656 0.91425401 0.21934283 0.90644902 0.24074033
		 0.90045393 0.2571761;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.12356257 0.074893691 -0.091321528 
		0.16680215 -0.041406631 0.029601654 0.041532982 -0.11774413 0.12175984 -0.12361888 
		-0.075731859 0.090517439 -0.16680215 0.041409727 -0.029604545 -0.04152891 0.11774413 
		-0.12175984;
	setAttr -s 6 ".vt[0:5]"  0.22276823 -2.55558419 -2.99371409 0.37252808 -2.95838904 -2.574898
		 -0.061340302 -3.22278309 -2.25570917 -0.63334191 -3.077274084 -2.36391687 -0.78290671 -2.67155552 -2.77995801
		 -0.34902424 -2.4071722 -3.099136829;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 2 1 0 1 0 0 3 2 0 4 3 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -4 -3 -5 -6 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface149" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.1473532915115356 -0.00024431943893432617 2.2866839170455933 ;
	setAttr ".sp" -type "double3" -3.1473532915115356 -0.00024431943893432617 2.2866839170455933 ;
createNode mesh -n "polySurfaceShape150" -p "polySurface149";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.3104226 0.52278996
		 0.31047353 0.47722736 0.32890138 0.45508265 0.34732923 0.47722736 0.34738022 0.52278996
		 0.32890135 0.54498547;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.088334903 0.086619705 
		-0.12291703 -0.089604549 -0.08661551 -0.12199086 -0.0017246252 -0.17091124 0.0012536377 
		0.088331394 -0.08661551 0.12291703 0.089604549 0.08661969 0.12199558 0.00078203063 
		0.17091124 -0.00056767004;
	setAttr -s 6 ".vt[0:5]"  -3.45330024 0.29976204 1.86096215 -3.45769763 -0.30023617 1.86416996
		 -3.15332651 -0.59219348 2.29102588 -2.8414185 -0.30023617 2.71240568 -2.83700895 0.29976201 2.70921421
		 -3.14464474 0.59170485 2.2847178;
	setAttr -s 6 ".ed[0:5]"  1 0 0 2 1 0 4 3 0 3 2 0 0 5 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -2 -4 -3 -6 -5
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface150" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.6108981370925903 1.0753669440746307 2.6774227619171143 ;
	setAttr ".sp" -type "double3" -2.6108981370925903 1.0753669440746307 2.6774227619171143 ;
createNode mesh -n "polySurfaceShape151" -p "polySurface150";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.33301154 0.6071713
		 0.33350277 0.56156045 0.35149035 0.53759551 0.37034881 0.55805725 0.37182987 0.60351932
		 0.35300249 0.62923819;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.086351968 0.089805633 
		-0.12175977 -0.12263329 -0.076699123 -0.090517506 -0.037170738 -0.16771069 0.029604545 
		0.087128662 -0.089800641 0.12175977 0.12263329 0.077024981 0.091321528 0.037948396 
		0.16771069 -0.029601585;
	setAttr -s 6 ".vt[0:5]"  -2.9099772 1.38640773 2.25570917 -3.03563714 0.8097204 2.3639164
		 -2.73963857 0.49450284 2.77995777 -2.309129 0.76434344 3.099136353 -2.18615913 1.34214211 2.99371386
		 -2.47946429 1.65623105 2.574898;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 4 3 0 3 2 0 2 1 0 1 0 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -6 -5 -4 -3 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface151" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.3527770042419434 1.0753667801618576 1.655311644077301 ;
	setAttr ".sp" -type "double3" -3.3527770042419434 1.0753667801618576 1.655311644077301 ;
createNode mesh -n "polySurfaceShape152" -p "polySurface151";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.28597286 0.60351932
		 0.28745395 0.55805719 0.30631238 0.53759545 0.32429993 0.56156045 0.32479119 0.6071713
		 0.30480027 0.62923819;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.049076181 0.077024959 
		-0.14472683 -0.088996194 -0.089800641 -0.12036586 -0.039762028 -0.16771071 0.026327441 
		0.048071429 -0.076699093 0.14472683 0.088996194 0.089805678 0.11987574 0.039759483 
		0.16771071 -0.026819389;
	setAttr -s 6 ".vt[0:5]"  -3.52275181 1.34214187 1.1540519 -3.66101432 0.76434326 1.23842585
		 -3.49049234 0.49450263 1.74649644 -3.18628216 0.80972034 2.15657139 -3.04453969 1.38640773 2.070499897
		 -3.21507049 1.65623093 1.56242299;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 1 0 0 2 1 0 3 2 0 4 3 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -3 -4 -5 -6 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface152" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.202178031206131 -0.00024431943893432617 3.6999374628067017 ;
	setAttr ".sp" -type "double3" 1.202178031206131 -0.00024431943893432617 3.6999374628067017 ;
createNode mesh -n "polySurfaceShape153" -p "polySurface152";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.48304909 0.52278996
		 0.48310006 0.47722736 0.50152791 0.45508265 0.51995581 0.47722736 0.52000678 0.52278996
		 0.50152791 0.54498547;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.14419748 0.086619705 0.046027258 
		-0.14370899 -0.08661551 0.047521036 0.00065986952 -0.17091124 0.0020268916 0.14419748 
		-0.08661551 -0.046025466 0.14371458 0.086619705 -0.047521036 -0.0002976628 0.17091124 
		-0.00091991253;
	setAttr -s 6 ".vt[0:5]"  0.7027517 0.29976204 3.85935235 0.70444357 -0.30023617 3.86452603
		 1.20446348 -0.59219348 3.70695758 1.70160437 -0.30023617 3.54052877 1.69993186 0.29976204 3.53534889
		 1.20114708 0.59170485 3.69675136;
	setAttr -s 6 ".ed[0:5]"  1 0 0 2 1 0 4 3 0 3 2 0 0 5 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -2 -4 -3 -6 -5
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface153" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.7399842143058777 1.0753669440746307 3.3109110593795776 ;
	setAttr ".sp" -type "double3" 1.7399842143058777 1.0753669440746307 3.3109110593795776 ;
createNode mesh -n "polySurfaceShape154" -p "polySurface153";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.50563812 0.6071713
		 0.50612932 0.56156045 0.52411693 0.53759551 0.54297537 0.55805725 0.54445642 0.60351932
		 0.52562904 0.62923819;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.14260466 0.089805663 0.044375498 
		-0.12410302 -0.076699123 0.088535495 0.016549185 -0.16771069 0.044375565 0.14260466 
		-0.089800641 -0.0453627 0.12462777 0.077024981 -0.088535495 -0.016546087 0.16771069 
		-0.0453627;
	setAttr -s 6 ".vt[0:5]"  1.24607456 1.38640785 3.46460509 1.3101548 0.8097204 3.61755276
		 1.79730213 0.49450284 3.46460533 2.23389387 0.76434344 3.15379786 2.1716311 1.34214211 3.0042693615
		 1.68267703 1.65623105 3.15379786;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 4 3 0 3 2 0 2 1 0 1 0 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -6 -5 -4 -3 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface154" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.53769229725003242 1.0753667652606964 3.6999372243881226 ;
	setAttr ".sp" -type "double3" 0.53769229725003242 1.0753667652606964 3.6999372243881226 ;
createNode mesh -n "polySurfaceShape155" -p "polySurface154";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.45859939 0.60351932
		 0.46008047 0.55805719 0.47893888 0.53759545 0.49692655 0.56156045 0.49741781 0.6071713
		 0.47742674 0.62923813;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.15265355 0.077024966 0.0020269603 
		-0.14182086 -0.089800641 0.047521036 0.012906968 -0.16771071 0.046027258 0.15265355 
		-0.076699086 -0.00091984367 0.14166519 0.089805685 -0.047521036 -0.013065168 0.16771071 
		-0.046025399;
	setAttr -s 6 ".vt[0:5]"  0.0089784665 1.34214187 3.70695758 0.046497356 0.76434326 3.86452579
		 0.58239543 0.4945026 3.85935211 1.066406131 0.80972034 3.69675136 1.028348088 1.38640773 3.53534865
		 0.49244124 1.65623093 3.54052877;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 1 0 0 2 1 0 3 2 0 4 3 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -3 -4 -5 -6 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface155" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.8923602104187012 -0.00024431943893432617 2.6822090148925781e-007 ;
	setAttr ".sp" -type "double3" 3.8923602104187012 -0.00024431943893432617 2.6822090148925781e-007 ;
createNode mesh -n "polySurfaceShape156" -p "polySurface155";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.65567571 0.52278996
		 0.65572667 0.47722736 0.6741544 0.45508265 0.69258237 0.47722736 0.69263327 0.52278996
		 0.6741544 0.54498547;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.0013673231 0.086619705 
		0.15136431 0.00020431027 -0.08661551 0.15136132 0.0015491924 -0.17091127 -5.7424824e-008 
		0.00020424144 -0.08661551 -0.15136144 -0.0013673231 0.086619705 -0.15136431 -0.0015491924 
		0.17091127 -1.1729953e-009;
	setAttr -s 6 ".vt[0:5]"  3.8876245 0.29976204 0.52424884 3.89306784 -0.30023617 0.52423847
		 3.89772582 -0.59219354 6.9330675e-008 3.8930676 -0.30023617 -0.52423835 3.8876245 0.29976204 -0.5242483
		 3.8869946 0.59170491 2.6415825e-007;
	setAttr -s 6 ".ed[0:5]"  4 3 0 3 2 0 1 0 0 2 1 0 0 5 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -3 -4 -2 -1 -6 -5
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface156" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.6849241256713867 1.0753669291734695 -0.63222377002239227 ;
	setAttr ".sp" -type "double3" 3.6849241256713867 1.0753669291734695 -0.63222377002239227 ;
createNode mesh -n "polySurfaceShape157" -p "polySurface156";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.67826462 0.6071713
		 0.67875582 0.56156045 0.69674349 0.53759551 0.71560192 0.55805725 0.71708292 0.60351932
		 0.6982556 0.62923819;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.0013946517 0.089805633 
		0.1494904 0.046321299 -0.076699138 0.14554049 0.047786579 -0.16771071 -0.0018738868 
		0.0013936879 -0.089800633 -0.1494904 -0.045221273 0.077024952 -0.14573444 -0.047786579 
		0.16771071 0.0018709698;
	setAttr -s 6 ".vt[0:5]"  3.68009377 1.38640773 -0.11446545 3.84535742 0.80972034 -0.12814592
		 3.8504324 0.49450281 -0.63871396 3.68975115 0.76434344 -1.14998209 3.52830076 1.34214199 -1.13697338
		 3.51941586 1.65623105 -0.62574369;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 4 3 0 3 2 0 2 1 0 1 0 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -6 -5 -4 -3 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface157" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 3.6849241256713867 1.0753667503595352 0.6322241984307766 ;
	setAttr ".sp" -type "double3" 3.6849241256713867 1.0753667503595352 0.6322241984307766 ;
createNode mesh -n "polySurfaceShape158" -p "polySurface157";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.631226 0.60351932
		 0.63270706 0.55805725 0.65156549 0.53759545 0.66955304 0.56156045 0.67004436 0.60717124
		 0.65005338 0.62923813;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  -0.045221273 0.077024974 
		0.14573446 0.0013936879 -0.089800633 0.14949042 0.047786579 -0.16771072 0.0018739008 
		0.046321299 -0.076699086 -0.14554045 -0.0013946517 0.089805685 -0.14949042 -0.047786579 
		0.16771072 -0.001870973;
	setAttr -s 6 ".vt[0:5]"  3.52830076 1.34214187 1.13697386 3.68975115 0.76434326 1.14998257
		 3.8504324 0.49450257 0.63871443 3.84535742 0.80972034 0.12814651 3.68009377 1.38640773 0.11446583
		 3.51941586 1.65623093 0.6257441;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 1 0 0 2 1 0 3 2 0 4 3 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -3 -4 -5 -6 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface158" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.2021783888339996 -0.00024431943893432617 -3.6999373435974121 ;
	setAttr ".sp" -type "double3" 1.2021783888339996 -0.00024431943893432617 -3.6999373435974121 ;
createNode mesh -n "polySurfaceShape159" -p "polySurface158";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.8283022 0.52278996
		 0.82835323 0.47722736 0.84678096 0.45508265 0.8652088 0.47722736 0.86525983 0.52278996
		 0.84678108 0.54498547;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.14371462 0.086619705 0.04752107 
		0.1441974 -0.08661551 0.046025433 0.00065980072 -0.17091124 -0.002026926 -0.14370902 
		-0.08661551 -0.04752107 -0.1441974 0.086619705 -0.046027225 -0.00029759397 0.17091124 
		0.00091987813;
	setAttr -s 6 ".vt[0:5]"  1.69993234 0.29976204 -3.53534865 1.70160449 -0.30023617 -3.54052877
		 1.2044636 -0.59219348 -3.70695758 0.70444381 -0.30023617 -3.86452603 0.70275229 0.29976204 -3.85935211
		 1.20114768 0.59170485 -3.69675136;
	setAttr -s 6 ".ed[0:5]"  1 0 0 2 1 0 4 3 0 3 2 0 0 5 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -2 -4 -3 -6 -5
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface159" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 0.53769280528649688 1.0753669440746307 -3.6999372243881226 ;
	setAttr ".sp" -type "double3" 0.53769280528649688 1.0753669440746307 -3.6999372243881226 ;
createNode mesh -n "polySurfaceShape160" -p "polySurface159";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.85089123 0.6071713
		 0.85138243 0.56156045 0.86937004 0.53759551 0.88822848 0.55805725 0.88970953 0.60351932
		 0.87088209 0.62923819;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.14166512 0.089805663 0.047521036 
		0.15265357 -0.076699123 0.00091984367 0.012906958 -0.16771069 -0.046027258 -0.14182088 
		-0.089800641 -0.047521036 -0.15265357 0.077024952 -0.0020269603 -0.013065202 0.16771069 
		0.046025399;
	setAttr -s 6 ".vt[0:5]"  1.028348327 1.38640785 -3.53534865 1.066406727 0.8097204 -3.69675136
		 0.58239591 0.49450284 -3.85935211 0.046497814 0.76434344 -3.86452579 0.0089788865 1.34214199 -3.70695758
		 0.49244162 1.65623105 -3.54052877;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 4 3 0 3 2 0 2 1 0 1 0 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -6 -5 -4 -3 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface160" -p "IcosaSphere";
	setAttr ".rp" -type "double3" 1.7399846315383911 1.0753667950630188 -3.3109108209609985 ;
	setAttr ".sp" -type "double3" 1.7399846315383911 1.0753667950630188 -3.3109108209609985 ;
createNode mesh -n "polySurfaceShape161" -p "polySurface160";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.8038525 0.60351932
		 0.80533361 0.55805719 0.82419211 0.53759545 0.8421796 0.56156045 0.84267074 0.60717124
		 0.82267994 0.62923813;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.12462772 0.077024959 0.088535495 
		0.14260468 -0.089800648 0.0453627 0.016549235 -0.16771071 -0.044375565 -0.12410297 
		-0.0766991 -0.088535495 -0.14260468 0.08980567 -0.044375565 -0.016546104 0.16771071 
		0.045362629;
	setAttr -s 6 ".vt[0:5]"  2.17163134 1.34214187 -3.0042691231 2.23389435 0.76434326 -3.15379763
		 1.79730272 0.49450266 -3.46460509 1.31015539 0.80972034 -3.61755252 1.24607491 1.38640773 -3.46460509
		 1.68267739 1.65623093 -3.15379786;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 1 0 0 2 1 0 3 2 0 4 3 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -3 -4 -5 -6 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface161" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.1473530530929565 -0.00024434924125671387 -2.2866839170455933 ;
	setAttr ".sp" -type "double3" -3.1473530530929565 -0.00024434924125671387 -2.2866839170455933 ;
createNode mesh -n "polySurfaceShape162" -p "polySurface161";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.13779606 0.52278996
		 0.13784702 0.47722736 0.15627487 0.45508265 0.17470272 0.47722736 0.17475368 0.52278996
		 0.15627487 0.54498547;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.089604549 0.086619712 -0.12199558 
		0.088331327 -0.086615503 -0.12291697 -0.001724694 -0.17091127 -0.0012535688 -0.089604549 
		-0.086615503 0.12199086 -0.088334836 0.086619712 0.12291697 0.00078203063 0.17091127 
		0.00056760124;
	setAttr -s 6 ".vt[0:5]"  -2.83700871 0.29976204 -2.70921421 -2.8414185 -0.30023617 -2.71240544
		 -3.15332651 -0.5921936 -2.29102564 -3.45769739 -0.30023617 -1.86416996 -3.45329976 0.29976204 -1.86096239
		 -3.1446445 0.59170491 -2.28471804;
	setAttr -s 6 ".ed[0:5]"  1 0 0 2 1 0 4 3 0 3 2 0 0 5 0 5 4 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -1 -2 -4 -3 -6 -5
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface162" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -3.3527767658233643 1.075366884469986 -1.6553120613098145 ;
	setAttr ".sp" -type "double3" -3.3527767658233643 1.075366884469986 -1.6553120613098145 ;
createNode mesh -n "polySurfaceShape163" -p "polySurface162";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.16038503 0.6071713
		 0.16087629 0.56156045 0.17886381 0.53759545 0.1977223 0.55805725 0.19920336 0.60351932
		 0.18037598 0.62923819;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.088996194 0.089805648 -0.11987568 
		0.048071429 -0.076699123 -0.14472684 -0.039762028 -0.16771071 -0.026327424 -0.088996194 
		-0.089800626 0.12036587 -0.049076181 0.077024966 0.14472684 0.039759483 0.16771071 
		0.026819406;
	setAttr -s 6 ".vt[0:5]"  -3.044539452 1.38640773 -2.070500135 -3.18628192 0.80972034 -2.15657187
		 -3.49049211 0.49450272 -1.7464968 -3.66101408 0.76434344 -1.23842621 -3.52275157 1.34214199 -1.15405226
		 -3.21507025 1.65623105 -1.56242335;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 4 3 0 3 2 0 2 1 0 1 0 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -6 -5 -4 -3 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface163" -p "IcosaSphere";
	setAttr ".rp" -type "double3" -2.6108978986740112 1.0753667801618576 -2.6774230003356934 ;
	setAttr ".sp" -type "double3" -2.6108978986740112 1.0753667801618576 -2.6774230003356934 ;
createNode mesh -n "polySurfaceShape164" -p "polySurface163";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 6 ".uvst[0].uvsp[0:5]" -type "float2" 0.11334638 0.60351932
		 0.11482744 0.55805725 0.13368587 0.53759545 0.15167345 0.56156045 0.15216468 0.6071713
		 0.13217376 0.62923819;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt[0:5]" -type "float3"  0.12263329 0.077024959 -0.091321528 
		0.087128662 -0.089800641 -0.12175977 -0.037170738 -0.16771071 -0.029604545 -0.12263329 
		-0.076699093 0.090517439 -0.086352035 0.089805678 0.12175977 0.037948396 0.16771071 
		0.029601585;
	setAttr -s 6 ".vt[0:5]"  -2.1861589 1.34214187 -2.99371409 -2.30912876 0.76434326 -3.099136591
		 -2.73963833 0.49450263 -2.77995801 -3.035636902 0.80972034 -2.36391687 -2.9099772 1.38640773 -2.25570941
		 -2.47946405 1.65623093 -2.57489824;
	setAttr -s 6 ".ed[0:5]"  0 5 0 5 4 0 1 0 0 2 1 0 3 2 0 4 3 0;
	setAttr -ch 6 ".fc[0]" -type "polyFaces" 
		f 6 -3 -4 -5 -6 -2 -1
		mu 0 6 0 1 2 3 4 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n"
		+ "                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n"
		+ "                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n"
		+ "            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n"
		+ "            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n"
		+ "                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n"
		+ "                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n"
		+ "            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n"
		+ "            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n"
		+ "            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n"
		+ "                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n"
		+ "                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n"
		+ "                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n"
		+ "            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n"
		+ "            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n"
		+ "                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n"
		+ "                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n"
		+ "            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n"
		+ "            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -docTag \"isolOutln_fromSeln\" \n                -showShapes 0\n"
		+ "                -showReferenceNodes 1\n                -showReferenceMembers 1\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n"
		+ "                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                -ignoreHiddenAttribute 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n"
		+ "            -showShapes 0\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n"
		+ "            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n"
		+ "                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n"
		+ "                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n"
		+ "                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n"
		+ "                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n"
		+ "                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n"
		+ "                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n"
		+ "                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n"
		+ "                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n"
		+ "                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n"
		+ "                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n"
		+ "                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\tif ($useSceneConfig) {\n"
		+ "        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 2 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :initialShadingGroup;
	setAttr -s 323 ".dsm";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape2.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape3.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape4.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape5.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape6.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape7.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape8.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape9.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape10.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape11.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape12.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape13.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape15.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape16.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape17.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape18.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape19.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape20.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape21.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape22.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape23.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape24.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape25.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape26.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape27.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape28.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape29.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape30.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape31.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape32.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape33.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape34.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape35.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape36.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape37.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape38.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape39.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape40.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape41.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape42.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape43.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape44.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape45.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape46.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape47.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape48.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape49.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape50.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape51.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape52.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape53.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape54.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape55.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape56.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape57.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape58.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape59.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape60.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape61.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape62.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape63.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape64.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape65.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape66.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape67.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape68.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape69.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape70.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape71.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape72.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape73.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape74.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape75.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape76.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape77.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape78.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape79.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape80.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape81.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape82.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape83.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape84.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape85.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape86.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape87.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape88.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape89.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape90.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape91.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape92.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape93.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape94.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape95.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape96.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape97.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape98.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape99.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape100.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape101.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape102.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape103.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape104.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape105.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape106.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape107.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape108.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape109.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape110.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape111.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape112.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape113.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape114.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape115.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape116.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape117.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape118.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape119.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape120.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape121.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape122.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape123.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape124.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape125.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape126.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape127.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape128.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape129.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape130.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape131.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape132.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape133.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape134.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape135.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape136.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape137.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape138.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape139.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape140.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape141.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape142.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape143.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape144.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape145.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape146.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape147.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape148.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape149.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape150.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape151.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape152.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape153.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape154.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape155.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape156.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape157.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape158.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape159.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape160.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape161.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape162.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape163.iog.og[0].gco";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape164.iog.og[0].gco";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "polySurfaceShape2.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape3.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape4.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape5.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape6.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape7.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape8.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape9.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape10.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape11.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape12.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape13.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape15.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape16.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape17.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape18.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape19.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape20.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape21.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape22.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape23.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape24.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape25.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape26.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape27.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape28.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape29.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape30.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape31.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape32.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape33.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape34.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape35.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape36.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape37.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape38.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape39.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape40.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape41.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape42.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape43.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape44.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape45.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape46.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape47.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape48.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape49.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape50.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape51.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape52.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape53.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape54.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape55.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape56.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape57.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape58.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape59.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape60.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape61.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape62.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape63.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape64.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape65.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape66.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape67.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape68.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape69.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape70.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape71.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape72.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape73.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape74.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape75.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape76.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape77.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape78.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape79.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape80.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape81.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape82.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape83.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape84.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape85.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape86.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape87.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape88.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape89.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape90.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape91.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape92.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape93.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape94.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape95.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape96.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape97.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape98.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape99.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape100.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape101.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape102.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape103.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape104.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape105.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape106.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape107.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape108.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape109.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape110.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape111.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape112.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape113.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape114.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape115.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape116.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape117.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape118.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape119.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape120.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape121.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape122.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape123.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape124.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape125.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape126.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape127.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape128.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape129.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape130.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape131.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape132.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape133.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape134.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape135.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape136.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape137.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape138.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape139.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape140.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape141.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape142.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape143.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape144.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape145.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape146.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape147.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape148.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape149.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape150.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape151.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape152.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape153.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape154.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape155.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape156.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape157.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape158.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape159.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape160.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape161.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape162.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape163.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape164.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape163.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape162.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape161.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape160.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape159.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape158.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape157.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape156.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape155.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape154.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape153.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape152.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape151.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape150.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape149.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape148.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape147.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape146.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape145.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape144.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape143.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape142.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape141.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape140.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape139.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape138.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape137.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape136.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape135.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape134.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape133.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape132.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape131.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape130.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape129.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape128.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape127.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape126.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape125.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape124.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape123.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape122.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape121.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape120.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape119.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape118.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape117.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape116.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape115.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape114.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape113.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape112.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape111.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape110.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape109.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape108.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape107.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape106.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape105.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape104.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape103.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape102.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape101.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape100.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape99.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape98.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape97.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape96.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape95.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape94.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape93.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape92.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape91.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape90.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape89.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape88.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape87.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape86.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape85.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape84.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape83.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape82.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape81.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape80.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape79.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape78.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape77.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape76.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape75.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape74.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape73.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape72.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape71.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape70.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape69.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape68.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape67.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape66.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape65.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape64.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape63.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape62.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape61.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape60.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape59.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape58.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape57.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape56.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape55.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape54.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape53.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape52.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape51.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape50.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape49.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape48.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape47.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape46.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape45.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape44.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape43.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape42.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape41.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape40.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape39.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape38.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape37.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape36.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape35.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape34.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape33.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape32.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape31.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape30.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape29.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape28.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape27.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape26.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape25.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape24.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape23.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape22.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape21.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape20.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape19.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape18.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape17.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape16.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape15.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape13.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape12.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape11.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape10.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape9.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape8.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape7.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape6.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape5.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape4.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape3.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape2.iog" ":initialShadingGroup.dsm" -na;
// End of hex_sphere_seperated.ma
