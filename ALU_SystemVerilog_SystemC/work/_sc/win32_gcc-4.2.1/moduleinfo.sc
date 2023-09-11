@0;moduleinfo.sc;5;17;0;gnuc;4;2;0

F5;D:/HocTap/DA_1/ALU_dut\TOP.cpp
F4;D:/HocTap/DA_1/ALU_dut\TOP_testbench.cpp
F3;D:/HocTap/DA_1/ALU_dut\testbench.cpp
F2;D:/HocTap/DA_1/ALU_dut\stimulus.cpp
F1;C:/questasim_10.6c\include\systemc/ptrarray.h
F0;C:/questasim_10.6c\include\systemc/sc_foreign_module.h


T14;<ignored>;23;0;0;0;0;0;<NONE>

T13;<pointer>;11;65536;4;4;0;0;<NONE>

M12;ExampleStim;19;12288;840;840;0;0;testbench.dbs;F2;L3
B0;sc_core::sc_module;256;0;<NONE>;M2
P0;clk;12;132;testbench.dbs;T9;F2;L4
P0;A;20;248;testbench.dbs;T4;F2;L5
P0;B;20;360;testbench.dbs;T4;F2;L6
P0;control;20;472;testbench.dbs;T0;F2;L7
P0;result;12;584;testbench.dbs;T4;F2;L8
P0;result_X;12;692;testbench.dbs;T4;F2;L9
V0;temp_A;0;800;testbench.dbs;T8;F2;L10
V0;temp_B;0;804;testbench.dbs;T8;F2;L10
V0;temp_C;0;808;testbench.dbs;T0;F2;L11
N0;ExampleStim;(sc_core::sc_module_name);testbench.dbs;F2;L41
N0;monitor;();testbench.dbs;F2;L28
N0;stim;();testbench.dbs;F2;L14

M11;TOP;19;12288;808;808;0;0;testbench.dbs;F5;L6
B0;sc_core::sc_foreign_module;256;0;testbench.dbs;T5;F0;L0
P0;clk;12;144;testbench.dbs;T9;F5;L9
P0;A;12;260;testbench.dbs;T4;F5;L10
P0;B;12;368;testbench.dbs;T4;F5;L11
P0;control;12;476;testbench.dbs;T0;F5;L12
P0;result;20;584;testbench.dbs;T4;F5;L13
P0;result_X;20;696;testbench.dbs;T4;F5;L14
N0;~TOP;();testbench.dbs;F5;L29
N0;TOP;(sc_core::sc_module_name<unnamed>,);testbench.dbs;F5;L25

M10;TOP_testbench;19;12288;800;800;0;0;testbench.dbs;F4;L7
B0;sc_core::sc_module;256;0;<NONE>;M2
P0;clk;12;132;testbench.dbs;T9;F4;L11
P0;A;12;248;testbench.dbs;T4;F4;L12
P0;B;12;356;testbench.dbs;T4;F4;L13
P0;control;12;464;testbench.dbs;T0;F4;L14
P0;result;20;572;testbench.dbs;T4;F4;L15
P0;result_X;20;684;testbench.dbs;T4;F4;L16
C0;block0;33;796;testbench.dbs;M11;F4;L19
N0;~TOP_testbench;();testbench.dbs;F4;L39
N0;TOP_testbench;(sc_core::sc_module_name);testbench.dbs;F4;L28

T9;bool;12;0;1;1;0;0;<NONE>

T8;int;5;0;4;4;0;0;<NONE>

T7;ptrarray<char *>;0;1024;12;12;0;0;testbench.dbs;F1;L35
V0;m_ptr;32;0;testbench.dbs;T14;F1;L130
V0;m_size;0;4;testbench.dbs;T8;F1;L131
V0;m_phys_size;0;8;testbench.dbs;T8;F1;L132
N0;resize_physical;(<unnamed>);testbench.dbs;F1;L164
N0;operator=;(<unnamed>);<NONE>
N0;ptrarray;(<unnamed>);<NONE>
N0;copy_from;(<unnamed>);testbench.dbs;F1;L306
N0;swap;(<unnamed>);testbench.dbs;F1;L289
N0;pop_back;(<unnamed>);testbench.dbs;F1;L318
N0;push_back;(<unnamed>);testbench.dbs;F1;L263
N0;removeFast;(<unnamed>);testbench.dbs;F1;L247
N0;remove;(<unnamed>);testbench.dbs;F1;L213
N0;get_rawptr;();testbench.dbs;F1;L206
N0;operator[];(<unnamed>);testbench.dbs;F1;L197
N0;operator[];(<unnamed>);testbench.dbs;F1;L188
N0;reserve;(<unnamed>);testbench.dbs;F1;L277
N0;resize;(<unnamed>);testbench.dbs;F1;L96
N0;size;();testbench.dbs;F1;L95
N0;~ptrarray;();testbench.dbs;F1;L153
N0;ptrarray;();testbench.dbs;F1;L145

T6;sc_clock;30;0;0;0;0;0;<NONE>

T5;sc_core::sc_foreign_module;0;9472;144;144;0;0;testbench.dbs;F0;L16
B0;sc_core::sc_module;256;0;<NONE>;M2
V0;m_parameter_list;0;132;testbench.dbs;T7;F0;L48
N0;clear_parameter_list;();<NONE>
N0;elaborate_foreign_module;(<unnamed><unnamed>,<unnamed>,);<NONE>
N0;add_parameter;(<unnamed><unnamed>,);<NONE>
N0;add_parameter;(<unnamed>);<NONE>
N0;~sc_foreign_module;();testbench.dbs;F0;L33
N0;sc_foreign_module;(<unnamed><unnamed>,<unnamed>,);<NONE>
N0;sc_foreign_module;(<unnamed><unnamed>,<unnamed>,<unnamed>,);<NONE>

T4;sc_int<16>;17;4096;16;32;0;0;<NONE>

M3;sc_main;19;2147491968;0;0;0;0;testbench.dbs;F3;L5
S0;clk;2;0;testbench.dbs;T6;F3;L7
S0;A;2;0;testbench.dbs;T4;F3;L8
S0;B;2;0;testbench.dbs;T4;F3;L9
S0;control;2;0;testbench.dbs;T0;F3;L10
S0;result;2;0;testbench.dbs;T4;F3;L11
S0;result_X;2;0;testbench.dbs;T4;F3;L12
C0;TOP_testbench_INST;33;0;testbench.dbs;M10;F3;L15
C0;tb;1;0;testbench.dbs;M12;F3;L27

M2;sc_module;19;4352;0;0;0;0;<NONE>

T1;sc_root;0;64;0;0;0;0;<NONE>
V0;ptrarray<char *>::m_default_init_size;64;0;testbench.dbs;T8;F1;L134

T0;sc_uint<4>;17;4608;4;32;0;0;<NONE>

