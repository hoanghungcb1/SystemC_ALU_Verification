#include <systemc.h>
#include "stimulus.cpp"
#include "TOP_testbench.cpp"

int sc_main(int argc, char* argv[])
{
    sc_clock clk("clk", 10, SC_NS, 0.5);
    sc_signal<sc_int<16> > A;
    sc_signal<sc_int<16> > B;
    sc_signal<sc_uint<4> > control;
    sc_signal<sc_int<16> > result;
    sc_signal<sc_int<16> > result_X;

// module instances
	TOP_testbench* TOP_testbench_INST;
// Create instances
	TOP_testbench_INST = new TOP_testbench("TOP_testbench_INST");
// Connect ports
	TOP_testbench_INST->clk(clk);
	TOP_testbench_INST->A(A);
	TOP_testbench_INST->B(B);
	TOP_testbench_INST->control(control);
	TOP_testbench_INST->result(result);
	TOP_testbench_INST->result_X(result_X);
  
  // Connect the test bench
  ExampleStim tb("ExampleTest");
    tb.clk(clk);
    tb.A(A);
    tb.B(B);
    tb.control(control);
    tb.result(result);
    tb.result_X(result_X);

  // Open VCD file
    sc_trace_file *wf = sc_create_vcd_trace_file("ALU_waveform");
    // Dump the desired signals
    sc_trace(wf, clk, "clk");
    sc_trace(wf, A, "A");
    sc_trace(wf, B, "B");
    sc_trace(wf, control, "control");
    sc_trace(wf, result, "result");
    sc_trace(wf, result_X, "result_X");

  //Run the simulation
    sc_start(120, SC_NS);

  sc_close_vcd_trace_file(wf);
  return 0;// Terminate simulation

};
