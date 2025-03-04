﻿using WebAPI.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;


namespace WebAPI.Services
{
    public class ProductService
    {
        private readonly CSDLBanHang _context;
        private readonly ColorSizesService _colorSizesService;

        public ProductService(CSDLBanHang context, ColorSizesService colorSizesService)
        {
            _context = context;
            _colorSizesService = colorSizesService;
        }
        public async Task DeleteDependencieAsync(int productId)
        {
            var product = await _context.Products.FindAsync(productId);
            if (product == null) return;


            var colorSizeIds = await _context.ColorSizes
                .Where(cs => cs.ProductId == productId)
                .Select(cs => cs.Id)
                .ToListAsync();

            if (colorSizeIds.Any())
            {
                await Task.WhenAll(colorSizeIds.Select(colorSizeId => _colorSizesService.DeleteDependencieAsync(colorSizeId)));
            }
          
            _context.Products.Remove(product);
            await _context.SaveChangesAsync();
        }

    }

}
