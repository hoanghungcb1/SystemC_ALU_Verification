#include <systemc.h>

SC_MODULE(ExampleStim) {
  sc_in_clk clk;
  sc_out<sc_int<16> > A;
  sc_out<sc_int<16> > B;
  sc_out<sc_uint<4> > control;
  sc_in<sc_int<16> > result;
  sc_in<sc_int<16> > result_X;
  int temp_A,temp_B;
  sc_uint<4> temp_C ;

// Processes
  void stim () {   
    while (true) {
      int dau_A = rand()&1 ?  -1 : 1;
	int dau_B = rand()&1 ?  -1 : 1;
      temp_A = dau_A*rand()%32768;
      temp_B = dau_B*rand()%32768;
      A.write(temp_A);
      B.write(temp_B);
      control.write(temp_C);
      temp_C = temp_C +1;
      wait();
    }
  }
  
  void monitor() {
    while (true) {
      cout << sc_time_stamp();
      cout << ": A = " << A.read();
      cout << "; B = " << B.read();
      cout << "; control = " << control.read();
      cout << "; result = " << result.read();
      cout << "; result_X = " << result_X.read() << endl;
      wait();
    }
  }
  // Constructor
    SC_CTOR(ExampleStim)
{
    // Register a thread in SystemC
    SC_THREAD(stim);
    sensitive << clk.neg();
    // Register a clocked thread in SystemC
    SC_CTHREAD(monitor, clk.neg());
  }    

};
