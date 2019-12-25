#include <verilated.h>          // Defines common routines
#include <iostream>             // Need std::cout
#include <Vour.h>               // From Verilating "top.v"

Vour *top;                      // Instantiation of module

vluint64_t main_time = 0;       // Current simulation time
        // This is a 64-bit integer to reduce wrap over issues and
        // allow modulus.  You can also use a double, if you wish.

double sc_time_stamp () {       // Called by $time in Verilog
    return main_time;           // converts to double, to match
                                // what SystemC does
}

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);   // Remember args

    top = new Vour;             // Create instance

    // top->reset_l = 0;           // Set some inputs

    while (!Verilated::gotFinish()) {
        if (main_time > 0 && main_time < 10) {
            top->A = 1;   // Deassert reset
            top->B = 0;
            top->C = 0;
            top->D = 1;
            top->Sel = 0;
        }
        if (main_time > 10 && main_time < 20) {
            top->A = 1;   // Deassert reset
            top->B = 1;
            top->C = 1;
            top->D = 1;
            top->Sel = 1;
        if (main_time > 20 && main_time < 30) {
            top->A = 1;   // Deassert reset
            top->B = 1;
            top->C = 1;
            top->D = 1;
            top->Sel = 2;
        top->eval();            // Evaluate model
        cout << top->out << endl;       // Read a output
        main_time++;            // Time passes...
    }

    top->final();               // Done simulating
    //    // (Though this example doesn't get here)
     delete top;
}