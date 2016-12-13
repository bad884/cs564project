\copy cookbook_recipe (id, title, description, instructions, serves) FROM 'epicurious/recipes_clean.tsv' DELIMITER E'\t';
UPDATE cookbook_recipe SET description = 'No description' WHERE description IS 'NoDescription';
UPDATE cookbook_recipe SET instructions = REPLACE(instructions, '@newline@', '\n');
\copy cookbook_foodgroup (id, name) FROM 'usda/fd_group.tsv' DELIMITER E'\t';
\copy cookbook_tag (tag_name) FROM 'epicurious/tags.tsv' DELIMITER E'\t';
\copy cookbook_ingredient (id, food_group_id, name) FROM 'usda/ingredients.tsv' DELIMITER E'\t';
CREATE INDEX ON cookbook_ingredient (food_group_id);
\copy cookbook_nutrient (id, unit, name) FROM 'usda/nutr_def_ascii.tsv' DELIMITER E'\t';
\copy cookbook_ingredientnutrient (id, ingredient_id, nutrient_id, amount) FROM 'usda/nut_data_w_id_clean.tsv' DELIMITER E'\t';
CREATE INDEX ON cookbook_ingredientnutrient (ingredient_id);
CREATE INDEX ON cookbook_ingredientnutrient (nutrient_id);
\copy cookbook_recipetag (id, recipe_id, tag_id) FROM 'epicurious/recipe_tags_w_id.tsv' DELIMITER E'\t';
CREATE INDEX ON cookbook_recipetag (recipe_id);
CREATE INDEX ON cookbook_recipetag (tag_id);
\copy cookbook_grammapping (id, ingredient_id, common_measure, amount_grams) FROM 'usda/weight_final.tsv' DELIMITER E'\t';
CREATE INDEX ON cookbook_grammapping (ingredient_id);
CREATE INDEX ON cookbook_grammapping (common_measure);
\copy cookbook_recipeingredient (id, recipe_id, ingredient_id, gram_mapping_id, amount) FROM 'epicurious/cookbook_recipeingredient.tsv' DELIMITER E'\t';
CREATE INDEX ON cookbook_recipeingredient (recipe_id);
CREATE INDEX ON cookbook_recipeingredient (ingredient_id);
CREATE INDEX ON cookbook_recipeingredient (gram_mapping_id);
CREATE INDEX ON cookbook_savedsearch (user_id);
CREATE INDEX ON cookbook_searchtag (search_id);
CREATE INDEX ON cookbook_searchtag (tag_id);
CREATE INDEX ON cookbook_searchtag (include);
CREATE INDEX ON cookbook_searchfoodgroup (search_id);
CREATE INDEX ON cookbook_searchfoodgroup (food_group_id);
CREATE INDEX ON cookbook_searchfoodgroup (include);
CREATE INDEX ON cookbook_userfavorite (user_id);
CREATE INDEX ON cookbook_userfavorite (recipe_id);
CREATE INDEX ON cookbook_usersubmission (user_id);
CREATE INDEX ON cookbook_usersubmission (recipe_id);
CREATE INDEX ON cookbook_nutritionpreference (user_id);
CREATE INDEX ON cookbook_nutritionpreference (nutrient_id);
