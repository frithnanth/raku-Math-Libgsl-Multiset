#include <gsl/gsl_multiset.h>
#include <gsl/gsl_errno.h>
#include <stdio.h>

int mgsl_multiset_fwrite(const char *filename, const gsl_multiset *p)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_multiset_fwrite(fp, p) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_multiset_fread(const char *filename, gsl_multiset *p)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_multiset_fread(fp, p) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_multiset_fprintf(const char *filename, const gsl_multiset *p, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_multiset_fprintf(fp, p, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_multiset_fscanf(const char *filename, gsl_multiset *p)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_multiset_fscanf(fp, p) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}
