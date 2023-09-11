#ifndef _SCGENMOD_TOP_
#define _SCGENMOD_TOP_

#include "systemc.h"

class TOP : public sc_foreign_module
{
public:
    sc_in<bool> clk;
    sc_in<sc_int<16> > A;
    sc_in<sc_int<16> > B;
    sc_in<sc_uint<4> > control;
    sc_out<sc_int<16> > result;
    sc_out<sc_int<16> > result_X;


    TOP(sc_module_name nm, const char* hdl_name)
     : sc_foreign_module(nm),
       clk("clk"),
       A("A"),
       B("B"),
       control("control"),
       result("result"),
       result_X("result_X")
    {
        elaborate_foreign_module(hdl_name);
    }
    ~TOP()
    {}

};

#endif
