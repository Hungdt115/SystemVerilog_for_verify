# SystemVerilog For Verify
---
## How to Run Simulations

To execute simulations, you typically need to navigate into the `SystemVerilog_for_verify/sim/` directory and use the provided cshell scripts.

1.  **Navigate to the simulation directory:**
```csh
cd SystemVerilog_for_verify/sim
```
2.  **Run a specific test:**
```bash
sim_go.csh <chapter_number> <Example_number>
```
*   `chapter_number`: The name of the DUT module.
*   `Example_number`: The name of the top-level testbench module.
**Example:** `csh sim_go.csh chap1 1`
or you can run all the test by run_all.csh
```bash
run_all.csh
```

3.  **Clean simulation artifacts:**
```bash
clean.csh
```
    
## Changelog Versioning Convention

This project uses the version format:
vC.E.P
- **C (Chapter)**: Chapter number  
- **E (Example)**: Example number within the chapter  
- **P (Patch)**: Minor fixes or small updates  

### Rules
- Adding a new example → increment **E**
- Fixing or refining an example → increment **P**
- Completing a chapter → version stays at the last example
- Starting a new chapter → increment **C**, reset **E** and **P** to `0`

### Example
- `v1.0.0` → Chapter 1 started  
- `v1.2.0` → Chapter 1, Example 2 added  
- `v1.2.1` → Small fix in Example 2  
- `v1.3.0` → Chapter 1 completed  
- `v2.0.0` → Chapter 2 started
