const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#070E19", /* black   */
  [1] = "#A04D32", /* red     */
  [2] = "#E0602D", /* green   */
  [3] = "#A0604E", /* yellow  */
  [4] = "#66827E", /* blue    */
  [5] = "#CFA66C", /* magenta */
  [6] = "#EAA864", /* cyan    */
  [7] = "#abbcba", /* white   */

  /* 8 bright colors */
  [8]  = "#778382",  /* black   */
  [9]  = "#A04D32",  /* red     */
  [10] = "#E0602D", /* green   */
  [11] = "#A0604E", /* yellow  */
  [12] = "#66827E", /* blue    */
  [13] = "#CFA66C", /* magenta */
  [14] = "#EAA864", /* cyan    */
  [15] = "#abbcba", /* white   */

  /* special colors */
  [256] = "#070E19", /* background */
  [257] = "#abbcba", /* foreground */
  [258] = "#abbcba",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
