{smcl}
{* *! Version 1.0 30dec2021}
{hi:help eiwb}{right: Version 1.0 December 30, 2021}
{hline}
{title:Title}

{phang}
{cmd:eiwb} {hline 2} Generate a variable for the ecological intensity of well-being.


{title:Syntax}

{phang}
{cmd:eiwb} {varlist}(min=2 max=2) [{cmd:,} {cmd:vname({it:string})} {cmd:ln}] {p_end}

{p 4 4}{varlist} consists of the environmental and human well-being variables. The environmental variable must be specified first. 


{title:Description}

{p 4 4}{cmd:eiwb} generates a variable for the ecological intensity of well-being (EIWB) based on the work of Dietz et al. (2009, 2012).
The EIWB measures how much stress is placed on the environment per unit of human well-being (environmental stress/human well-being). 
To prevent the numerator or denominator from dominating the ratio, the coefficient of variation of the two variables must be constrained to be equal (see New Economics Foundation 2009; Dietz et al. 2012). 
This is done by adding a constant (referred to as the correction factor) to the variable with the larger coefficient of variation, which shifts the mean without changing the variance.
The ratio is then multiplied by 100 to scale it. 
Following the generation of the variable, the coefficients of variation and the calculated correction factor are displayed on screen. 


{title:Options}

{phang}{opt vname(string)} specifies the name of the variable to be generated; default variable name is {bf:eiwb}. 

{phang}{opt ln} creates a variable consisting of the natural logarithms of the eiwb values. The variable includes a "_ln" suffix. 


{title:Example}

An example dataset of annual U.S. state-level CO_2 emissions per capita and health-adjusted life expectancy from 1999 to 2017 is available at {browse "https://github.com/rthombs/eiwb/blob/main/example.dta":here}.

{p 4}To generate the eiwb (make sure to specify the environmental variable first): {p_end}

{p 8}{stata eiwb co2pc hale} {p_end}

{p 4}Because our environmental variable is CO_2 emissions per capita, we can more aptly name it the ciwb (Jorgenson 2014; kelly 2020): {p_end}

{p 8}{stata eiwb co2pc hale, vname(ciwb)} {p_end}

{p 4}We can also generate an additional variable that consists of the natural logarithms of the eiwb: {p_end}

{p 8}{stata eiwb co2pc hale, vname(ciwb) ln} {p_end}


{title:References}

{p 4 8} Dietz, Thomas, Eugene A. Rosa and Richard York 2009. "Environmentally Efficient Well-Being: Rethinking Sustainability as the Relationship between Human Well-Being and Environmental Impacts." {it:Human Ecology Review} 16(1): 114–23.

{p 4 8} Dietz, Thomas, Eugene A. Rosa, and Richard York. 2012. "Environmentally Efficient Well-Being: Is there a Kuznets Curve?." {it:Applied Geography} 32(1): 21–28.

{p 4 8} Jorgenson, Andrew K. 2014. "Economic Development and the Carbon Intensity of Human Well-Being." {it:Nature Climate Change} 4(3): 186–89.

{p 4 8} Kelly, Orla. 2020. "The Silver Bullet? Assessing the Role of Education for Sustainability." {it:Social Forces} 99(1): 178-204.

{p 4 8} New Economics Foundation. 2009. {it:The happy planet index}. London: New Economics Foundation.


{title:Author}

{p 4}Ryan Thombs (Boston College){p_end}
{p 4}Email: {browse "mailto:thombs@bc.edu":thombs@bc.edu}{p_end}
{p 4}Web: {browse "www.ryanthombs.com":ryanthombs.com}{p_end}
