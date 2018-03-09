def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, amount)
  pet_shop[:admin][:pets_sold] += amount
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
  pets_of_this_breed = []

  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      pets_of_this_breed.push(pet)
    end
  end
  return pets_of_this_breed
end

def find_pet_by_name(pet_shop, name)

  for pet in pet_shop[:pets]
    return pet if pet[:name] == name
  end

  return nil
end

def remove_pet_by_name(pet_shop, name)
  pet_shop[:pets].delete(find_pet_by_name(pet_shop, name))
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, pet)
  return customer[:cash] >= pet[:price] ? true : false
end

# Not in original homework
def customer_total_cash(customer)
  return customer[:cash]
end

# Not in original homework
def add_or_remove_customer_cash(customer, amount)
  customer[:cash] += amount
end

def sell_pet_to_customer(pet_shop, pet, customer)
    if pet != nil && customer_can_afford_pet(customer, pet)
      add_pet_to_customer(customer, pet)
      increase_pets_sold(pet_shop, 1)
      add_or_remove_cash(pet_shop, pet[:price])
      remove_pet_by_name(pet_shop, pet[:name])
      # Not in original homework
      add_or_remove_customer_cash(customer, -(pet[:price]))
    end
end
