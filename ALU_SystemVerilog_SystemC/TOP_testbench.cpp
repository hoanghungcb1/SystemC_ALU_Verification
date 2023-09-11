#ifndef INCLUDED_TOP_testbench
#define INCLUDED_TOP_testbench

#include <systemc.h>
#include "TOP.cpp"

class TOP_testbench : public sc_module
{
public:
    // Module ports
    sc_in<bool> clk;
    sc_in<sc_int<16> > A;
    sc_in<sc_int<16> > B;
    sc_in<sc_uint<4> > control;
    sc_out<sc_int<16> > result;
    sc_out<sc_int<16> > result_X;

    // Child instances
    TOP*              block0;

    SC_CTOR(TOP_testbench)
        : clk("clk"),
	    	A("A"),
		B("B"),
		control("control"),
		result("result"),
		result_X("result_X")
    {
        block0 = new TOP("block0", "TOP");
        block0->clk(clk);
        block0->A(A);
        block0->B(B);
        block0->control(control);
        block0->result(result);
        block0->result_X(result_X);
    }

    ~TOP_testbench()
    {
        delete block0; block0 = 0;
    }
};

#endif
